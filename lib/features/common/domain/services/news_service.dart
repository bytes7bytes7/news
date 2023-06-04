import 'package:injectable/injectable.dart';

import '../entities/article/article.dart';
import '../exceptions/exceptions.dart';
import '../repositories/news_repository.dart';
import '../value_objects/article_id.dart';
import '../value_objects/news_result/news_result.dart';

const _query = 'war';
const _pageSize = 15;

@singleton
class NewsService {
  const NewsService(
    this._newsRepository,
  );

  final NewsRepository _newsRepository;

  Future<NewsResult> getTopNews({
    required int page,
  }) async {
    try {
      final result = await _newsRepository.getTopNews(
        query: _query,
        page: page,
        pageSize: _pageSize,
      );

      await _newsRepository.cacheAll(result.articles);

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
      await _newsRepository.save(id);
    } catch (e) {
      throw const ArticleSaveError();
    }
  }

  Future<void> removeFromSaved(ArticleID id) async {
    try {
      await _newsRepository.removeFromSaved(id);
    } catch (e) {
      throw const ArticleSaveError();
    }
  }
}
