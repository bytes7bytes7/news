import 'package:mapster/mapster.dart';

import '../../domain/dto/to_news_result.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/value_objects/news_result/news_result.dart';
import '../dto/news_response/news_response.dart';

class NewsResponseToNewsResultMapper
    extends TwoSourcesMapper<NewsResponse, ToNewsResult, NewsResult> {
  NewsResponseToNewsResultMapper(
    super.input,
    this._mapster,
  );

  final Mapster _mapster;

  @override
  NewsResult map() {
    final articles = <Article>[];
    for (var i = 0; i < _response.articles.length; i++) {
      articles.add(
        _mapster.map2(
          _response.articles[i],
          _info.toArticleList[i],
          To<Article>(),
        ),
      );
    }

    return NewsResult(
      totalResults: _response.totalResults,
      articles: articles,
    );
  }

  NewsResponse get _response => source1;

  ToNewsResult get _info => source2;
}
