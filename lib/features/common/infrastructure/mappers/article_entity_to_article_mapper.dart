import 'package:mapster/mapster.dart';

import '../../domain/entities/article/article.dart';
import '../../domain/value_objects/article_id.dart';
import '../db_entities/article_entity/article_entity.dart';

class ArticleEntityToArticleMapper
    extends OneSourceMapper<ArticleEntity, Article> {
  ArticleEntityToArticleMapper(super.input);

  @override
  Article map() {
    final publishedAt = DateTime.parse(_entity.publishedAt);

    return Article(
      id: ArticleID.fromString(_entity.id),
      sourceName: _entity.sourceName,
      author: _entity.author,
      title: _entity.title,
      description: _entity.description,
      url: _entity.url,
      imageUrl: _entity.imageUrl,
      publishedAt: publishedAt,
      publishedAtUtc: publishedAt.toUtc().toString(),
      content: _entity.content,
      isFavourite: _entity.isFavourite,
    );
  }

  ArticleEntity get _entity => source;
}
