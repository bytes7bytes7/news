part of 'top_news_bloc.dart';

abstract class TopNewsEvent extends Equatable {
  const TopNewsEvent();

  const factory TopNewsEvent.load() = _LoadEvent;

  const factory TopNewsEvent.loadMore() = _LoadMoreEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends TopNewsEvent {
  const _LoadEvent();
}

class _LoadMoreEvent extends TopNewsEvent {
  const _LoadMoreEvent();
}
