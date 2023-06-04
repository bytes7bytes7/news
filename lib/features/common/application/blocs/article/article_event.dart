part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  const factory ArticleEvent.setID({required String id}) = _SetIDEvent;

  const factory ArticleEvent.load() = _LoadEvent;

  const factory ArticleEvent.pressFavourite() = _PressFavouriteEvent;

  @override
  List<Object?> get props => [];
}

class _SetIDEvent extends ArticleEvent {
  const _SetIDEvent({required this.id});

  final String id;
}

class _LoadEvent extends ArticleEvent {
  const _LoadEvent();
}

class _PressFavouriteEvent extends ArticleEvent {
  const _PressFavouriteEvent();
}
