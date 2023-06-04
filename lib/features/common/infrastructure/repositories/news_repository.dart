import 'dart:collection';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../domain/dto/to_article.dart';
import '../../domain/dto/to_news_result.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/value_objects/article_id.dart';
import '../../domain/value_objects/news_result/news_result.dart';
import '../data_providers/news_data_provider.dart';
import '../db_entities/article_entity/article_entity.dart';

@Singleton(as: NewsRepository)
class ProdNewsRepository implements NewsRepository {
  ProdNewsRepository(
    this._newsDataProvider,
    this._mapster,
  );

  final NewsDataProvider _newsDataProvider;
  final Mapster _mapster;

  late final Box<ArticleEntity> _box;
  final _cache = HashMap<ArticleID, Article>();

  @override
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _box = await Hive.openBox('favourite_articles');
  }

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

      Article? saved;
      final entity = _box.get(id.value);
      if (entity != null) {
        saved = _mapster.map1(entity, To<Article>());
      }

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

      Article? saved;
      final entity = _box.get(id.value);
      if (entity != null) {
        saved = _mapster.map1(entity, To<Article>());
      }

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

  @override
  Future<Article?> getByID(ArticleID id) async {
    final cached = _cache[id];

    if (cached != null) {
      return cached;
    }

    Article? saved;
    final entity = _box.get(id.value);
    if (entity != null) {
      saved = _mapster.map1(entity, To<Article>());
    }

    return saved;
  }

  @override
  Future<void> save(ArticleID id) async {
    final saved = _box.get(id.value);

    if (saved != null) {
      return;
    }

    final article = _cache[id];

    if (article == null) {
      throw Exception('Article not found');
    }

    final entity = _mapster.map1(
      article.copyWith(isFavourite: true),
      To<ArticleEntity>(),
    );

    await _box.put(id.value, entity);

    final cached = _cache[id];

    if (cached != null) {
      _cache[id] = cached.copyWith(isFavourite: true);
    }
  }

  @override
  Future<void> removeFromSaved(ArticleID id) async {
    await _box.delete(id.value);

    final cached = _cache[id];

    if (cached != null) {
      _cache[id] = cached.copyWith(isFavourite: false);
    }
  }
}
