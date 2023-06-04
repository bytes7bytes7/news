import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../domain/dto/to_article.dart';
import '../../domain/dto/to_news_result.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/value_objects/article_id.dart';
import '../../domain/value_objects/news_result/news_result.dart';
import '../data_providers/news_data_provider.dart';

@Singleton(as: NewsRepository)
class ProdNewsRepository implements NewsRepository {
  ProdNewsRepository(
    this._newsDataProvider,
    this._mapster,
  );

  final NewsDataProvider _newsDataProvider;
  final Mapster _mapster;

  final _cache = HashMap<ArticleID, Article>();
  final _saved = HashMap<ArticleID, Article>();

  @override
  Future<NewsResult> getTopNews({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    final response = await _newsDataProvider.getTopNews(
      query: query,
      page: page,
      pageSize: pageSize,
    );

    final toArticles = <ToArticle>[];
    for (final e in response.articles) {
      final id =
          ArticleID(sourceName: e.source.name, publishedAt: e.publishedAt);
      final saved = _saved[id];

      toArticles.add(ToArticle(saved != null));
    }

    final result =
        _mapster.map2(response, ToNewsResult(toArticles), To<NewsResult>());

    return result;
  }

  @override
  Future<NewsResult> getAllNews({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    final response = await _newsDataProvider.getAllNews(
      query: query,
      page: page,
      pageSize: pageSize,
    );

    final toArticles = <ToArticle>[];
    for (final e in response.articles) {
      final id =
          ArticleID(sourceName: e.source.name, publishedAt: e.publishedAt);
      final saved = _saved[id];

      toArticles.add(ToArticle(saved != null));
    }

    final result =
        _mapster.map2(response, ToNewsResult(toArticles), To<NewsResult>());

    return result;
  }

  @override
  Future<void> cacheAll(List<Article> articles) async {
    for (final article in articles) {
      _cache[article.id] = article;
    }
  }
}
