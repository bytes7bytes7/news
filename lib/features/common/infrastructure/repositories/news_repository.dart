import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../domain/dto/to_article.dart';
import '../../domain/dto/to_news_result.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/value_objects/news_result/news_result.dart';
import '../data_providers/news_data_provider.dart';
import '../dto/article_response/article_response.dart';

class _ArticleID extends Equatable {
  const _ArticleID(
    this.sourceName,
    this.publishedAt,
  );

  factory _ArticleID.fromArticle(Article article) {
    return _ArticleID(
      article.sourceName,
      article.publishedAtUtc,
    );
  }

  factory _ArticleID.fromArticleResponse(ArticleResponse articleResponse) {
    return _ArticleID(
      articleResponse.source.name,
      articleResponse.publishedAt,
    );
  }

  final String sourceName;
  final String publishedAt;

  @override
  List<Object?> get props => [
        sourceName,
        publishedAt,
      ];
}

@Singleton(as: NewsRepository)
class ProdNewsRepository implements NewsRepository {
  ProdNewsRepository(
    this._newsDataProvider,
    this._mapster,
  );

  final NewsDataProvider _newsDataProvider;
  final Mapster _mapster;

  final _cache = HashMap<_ArticleID, Article>();
  final _saved = HashMap<_ArticleID, Article>();

  @override
  Future<NewsResult> getTopNews({required String query}) async {
    final response = await _newsDataProvider.getTopNews(
      query: query,
    );

    final toArticles = <ToArticle>[];
    for (final e in response.articles) {
      final id = _ArticleID.fromArticleResponse(e);
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
      final id = _ArticleID.fromArticle(article);
      _cache[id] = article;
    }
  }
}
