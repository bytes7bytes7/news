part of 'top_news_bloc.dart';

abstract class TopNewsEvent extends Equatable {
  const TopNewsEvent();

  const factory TopNewsEvent.load() = _LoadTopNewsEvent;

  @override
  List<Object?> get props => [];
}

class _LoadTopNewsEvent extends TopNewsEvent {
  const _LoadTopNewsEvent();
}
