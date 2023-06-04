import 'package:mapster/mapster.dart';

import '../../domain/entities/article/article.dart';
import '../db_entities/article_entity/article_entity.dart';

class ArticleToArticleEntityMapper
    extends OneSourceMapper<Article, ArticleEntity> {
  ArticleToArticleEntityMapper(super.input);

  @override
  ArticleEntity map() {
    return ArticleEntity(
      id: _article.id.value,
      sourceName: _article.sourceName,
      author: _article.author,
      title: _article.title,
      description: _article.description,
      url: _article.url,
      imageUrl: _article.imageUrl,
      publishedAt: _article.publishedAt.toString(),
      content: _article.content,
      isFavourite: _article.isFavourite,
    );
  }

  Article get _article => source;
}
