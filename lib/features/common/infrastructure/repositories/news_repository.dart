import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../domain/entities/article/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/value_objects/news_result/news_result.dart';
import '../data_providers/news_data_provider.dart';

class _ArticleID extends Equatable {
  const _ArticleID(
    this.sourceName,
    this.publishedAt,
  );

  factory _ArticleID.fromArticle(Article article) {
    return _ArticleID(
      article.sourceName,
      article.publishedAt,
    );
  }

  final String sourceName;
  final DateTime publishedAt;

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

  @override
  Future<NewsResult> getTopNews() async {
    final response = await _newsDataProvider.getTopNews();

    return _mapster.map1(response, To<NewsResult>());
  }

  @override
  Future<void> cacheAll(List<Article> articles) async {
    for (final article in articles) {
      final id = _ArticleID.fromArticle(article);
      _cache[id] = article;
    }
  }
}
