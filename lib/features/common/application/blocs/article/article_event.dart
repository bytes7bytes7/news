part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  const factory ArticleEvent.load() = _LoadEvent;

  @override
  List<Object?> get props => [];
}

class _LoadEvent extends ArticleEvent {
  const _LoadEvent();
}
