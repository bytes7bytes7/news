part of 'all_news_bloc.dart';

abstract class AllNewsEvent extends Equatable {
  const AllNewsEvent();

  const factory AllNewsEvent.load() = _LoadEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends AllNewsEvent {
  const _LoadEvent();
}
