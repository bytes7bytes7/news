part of 'top_news_bloc.dart';

abstract class TopNewsEvent extends Equatable {
  const TopNewsEvent();

  const factory TopNewsEvent.load() = _LoadEvent;

  const factory TopNewsEvent.loadMore() = _LoadMoreEvent;

  const factory TopNewsEvent.pressArticle({required String id}) =
      _PressArticleEvent;

  const factory TopNewsEvent.doublePressArticle({required String id}) =
      _DoublePressArticleEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends TopNewsEvent {
  const _LoadEvent();
}

class _LoadMoreEvent extends TopNewsEvent {
  const _LoadMoreEvent();
}

class _PressArticleEvent extends TopNewsEvent {
  const _PressArticleEvent({required this.id});

  final String id;
}

class _DoublePressArticleEvent extends TopNewsEvent {
  const _DoublePressArticleEvent({required this.id});

  final String id;
}
