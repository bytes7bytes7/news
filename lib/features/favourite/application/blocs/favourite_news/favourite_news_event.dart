part of 'favourite_news_bloc.dart';

abstract class FavouriteNewsEvent extends Equatable {
  const FavouriteNewsEvent();

  const factory FavouriteNewsEvent.load() = _LoadEvent;

  const factory FavouriteNewsEvent.loadMore() = _LoadMoreEvent;

  const factory FavouriteNewsEvent.pressArticle({required String id}) =
      _PressArticleEvent;

  const factory FavouriteNewsEvent.doublePressArticle({required String id}) =
      _DoublePressArticleEvent;

  const factory FavouriteNewsEvent._updateArticle(Article article) =
      _UpdateArticleEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends FavouriteNewsEvent {
  const _LoadEvent();
}

class _LoadMoreEvent extends FavouriteNewsEvent {
  const _LoadMoreEvent();
}

class _PressArticleEvent extends FavouriteNewsEvent {
  const _PressArticleEvent({required this.id});

  final String id;
}

class _DoublePressArticleEvent extends FavouriteNewsEvent {
  const _DoublePressArticleEvent({required this.id});

  final String id;
}

class _UpdateArticleEvent extends FavouriteNewsEvent {
  const _UpdateArticleEvent(this.article);

  final Article article;
}
