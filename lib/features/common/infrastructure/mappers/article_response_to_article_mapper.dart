import 'package:mapster/mapster.dart';

import '../../domain/dto/to_article.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/value_objects/article_id.dart';
import '../dto/article_response/article_response.dart';

class ArticleResponseToArticleMapper
    extends TwoSourcesMapper<ArticleResponse, ToArticle, Article> {
  ArticleResponseToArticleMapper(super.input);

  @override
  Article map() {
    return Article(
      id: ArticleID(
        sourceName: _response.source.name,
        publishedAt: _response.publishedAt,
      ),
      sourceName: _response.source.name,
      author: _response.author,
      title: _response.title,
      description: _response.description,
      url: _response.url,
      imageUrl: _response.urlToImage,
      publishedAtUtc: _response.publishedAt,
      publishedAt: DateTime.parse(_response.publishedAt).toLocal(),
      content: _response.content,
      isFavourite: _info.isFavourite,
    );
  }

  ArticleResponse get _response => source1;

  ToArticle get _info => source2;
}
