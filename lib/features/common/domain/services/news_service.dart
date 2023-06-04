import 'dart:async';
import 'dart:math';

import 'package:injectable/injectable.dart';

import '../entities/article/article.dart';
import '../events/news_event.dart';
import '../exceptions/exceptions.dart';
import '../repositories/news_repository.dart';
import '../value_objects/article_id.dart';
import '../value_objects/news_result/news_result.dart';

const _query = 'war';
const _pageSize = 15;
const _maxPageSize = 100;

@singleton
class NewsService {
  NewsService(
    this._newsRepository,
  );

  final NewsRepository _newsRepository;

  Stream<NewsEvent> get events => _eventController.stream;

  final _eventController = StreamController<NewsEvent>.broadcast();
  var _pollingPageSize = _pageSize;
  var _topNews = <Article>[];

  @postConstruct
  void init() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        final pageSize = min(_pollingPageSize, _maxPageSize);

        final result = await _newsRepository.getTopNews(
          query: _query,
          page: 0,
          pageSize: pageSize,
        );

       final topNews = List.of(_topNews);

       for (final newArticle in result.articles) {
         final index = topNews.indexWhere((e) => e.id == newArticle.id);

         if (index == -1) {
           continue;
         }

         final oldArticle = topNews[index];

         if (oldArticle != newArticle) {
           _eventController.add(NewsEvent.articleUpdated(newArticle));
           topNews[index] = newArticle;
         }
       }

       _topNews = topNews;
      } catch (e) {
        // ignore
      }
    });
  }

  @disposeMethod
  void dispose() {
    _eventController.close();
  }

  Future<NewsResult> getTopNews({
    required int page,
  }) async {
    try {
      _pollingPageSize = _pageSize * (page + 1);

      final result = await _newsRepository.getTopNews(
        query: _query,
        page: page,
        pageSize: _pageSize,
      );

      await _newsRepository.cacheAll(result.articles);

      if ((page + 1) * _pageSize > _topNews.length) {
        _topNews.addAll(result.articles);
      }

      return result;
    } catch (e) {
      throw const TopNewsNotLoaded();
    }
  }

  Future<NewsResult> getAllNews({
    required int page,
  }) async {
    try {
      final result = await _newsRepository.getAllNews(
        query: _query,
        page: page,
        pageSize: _pageSize,
      );

      await _newsRepository.cacheAll(result.articles);

      return result;
    } catch (e) {
      throw const AllNewsNotLoaded();
    }
  }

  Future<NewsResult> getFavouriteNews({
    required ArticleID? lastArticleID,
  }) async {
    try {
      final result = await _newsRepository.getFavouriteNews(
        lastArticleID: lastArticleID,
        pageSize: _pageSize,
      );

      for (final e in result.articles) {
        if (!e.isFavourite) {
          await _newsRepository.removeFromSaved(e.id);
        }
      }

      return result;
    } catch (e) {
      throw const FavouriteNewsNotLoaded();
    }
  }

  Future<Article?> getByID({
    required ArticleID id,
  }) async {
    try {
      final result = await _newsRepository.getByID(id);

      return result;
    } catch (e) {
      throw const ArticleNotFound();
    }
  }

  Future<void> save(ArticleID id) async {
    try {
      final article = await _newsRepository.save(id);

      if (article != null) {
        _eventController.add(NewsEvent.articleUpdated(article));
      }
    } catch (e) {
      throw const ArticleSaveError();
    }
  }

  Future<void> removeFromSaved(ArticleID id) async {
    try {
      final article = await _newsRepository.removeFromSaved(id);

      if (article != null) {
        _eventController.add(NewsEvent.articleUpdated(article));
      }
    } catch (e) {
      throw const ArticleSaveError();
    }
  }
}
