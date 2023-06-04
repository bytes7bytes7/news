import 'package:mapster/mapster.dart';

import '../../application/providers/beautified_date_time_provider.dart';
import '../../application/view_models/article_vm/article_vm.dart';
import '../../domain/entities/article/article.dart';

class ArticleToArticleVMMapper extends OneSourceMapper<Article, ArticleVM> {
  ArticleToArticleVMMapper(
    super.input,
    this._beautifiedDateTimeProvider,
  );

  final BeautifiedDateTimeProvider _beautifiedDateTimeProvider;

  @override
  ArticleVM map() {
    return ArticleVM(
      sourceName: _article.sourceName,
      author: _article.author,
      title: _article.title,
      description: _article.description,
      url: _article.url,
      imageUrl: _article.imageUrl,
      publishedAtShort: _beautifiedDateTimeProvider.short(_article.publishedAt),
      publishedAtFull: _beautifiedDateTimeProvider.full(_article.publishedAt),
      content: _article.content,
      isFavourite: _article.isFavourite,
    );
  }

  Article get _article => source;
}
