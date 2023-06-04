import '../entities/article/article.dart';

abstract class NewsEvent {
  const NewsEvent();

  const factory NewsEvent.articleUpdated(Article article) =
      ArticleUpdatedNewsEvent;
}

class ArticleUpdatedNewsEvent extends NewsEvent {
  const ArticleUpdatedNewsEvent(this.article);

  final Article article;
}
