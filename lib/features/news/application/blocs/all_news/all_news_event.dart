part of 'all_news_bloc.dart';

abstract class AllNewsEvent extends Equatable {
  const AllNewsEvent();

  const factory AllNewsEvent.load() = _LoadEvent;

  const factory AllNewsEvent.loadMore() = _LoadMoreEvent;

  const factory AllNewsEvent.pressArticle({required String id}) =
      _PressArticleEvent;

  const factory AllNewsEvent.doublePressArticle({required String id}) =
      _DoublePressArticleEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends AllNewsEvent {
  const _LoadEvent();
}

class _LoadMoreEvent extends AllNewsEvent {
  const _LoadMoreEvent();
}

class _PressArticleEvent extends AllNewsEvent {
  const _PressArticleEvent({required this.id});

  final String id;
}

class _DoublePressArticleEvent extends AllNewsEvent {
  const _DoublePressArticleEvent({required this.id});

  final String id;
}
