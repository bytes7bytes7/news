import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../../../common/application/view_models/view_models.dart';
import '../../../../common/domain/domain.dart';
import '../../coordinators/favourite_news_coordinator.dart';

part 'favourite_news_event.dart';

part 'favourite_news_state.dart';

@singleton
class FavouriteNewsBloc extends Bloc<FavouriteNewsEvent, FavouriteNewsState> {
  FavouriteNewsBloc(
    this._newsService,
    this._coordinator,
    this._mapster,
  ) : super(const FavouriteNewsState()) {
    on<_LoadEvent>(_load);
    on<_LoadMoreEvent>(_loadMore);
    on<_PressArticleEvent>(_pressArticle);
    on<_DoublePressArticleEvent>(_doublePressArticle);

    on<_UpdateArticleEvent>(_updateArticle);

    _newsSub = _newsService.events.listen((event) {
      if (event is ArticleUpdatedNewsEvent) {
        add(FavouriteNewsEvent._updateArticle(event.article));
      }
    });
  }

  final NewsService _newsService;
  final FavouriteNewsCoordinator _coordinator;
  final Mapster _mapster;

  StreamSubscription? _newsSub;

  @override
  @disposeMethod
  Future<void> close() async {
    await _newsSub?.cancel();

    await super.close();
  }

  Future<void> _load(
    _LoadEvent event,
    Emitter<FavouriteNewsState> emit,
  ) async {
    emit(state.withLoading());

    try {
      final result = await _newsService.getFavouriteNews(
        lastArticleID: null,
      );

      final articles = result.articles
          .map((e) => _mapster.map1(e, To<ArticleVM>()))
          .toList();

      String? lastID;
      if (articles.isNotEmpty) {
        lastID = articles.last.id;
      }

      emit(
        state.copyWith(
          lastArticleID: lastID,
          isLoading: false,
          articles: articles,
        ),
      );
    } catch (e) {
      emit(state.withError('Error'));
      emit(state.copyWith());
    }
  }

  Future<void> _loadMore(
    _LoadMoreEvent event,
    Emitter<FavouriteNewsState> emit,
  ) async {
    if (!state.canLoadMore) {
      return;
    }

    final oldArticles = List.of(state.articles);

    emit(
      state.copyWith(
        isLoadingMore: true,
      ),
    );

    final lastID = state.lastArticleID;

    try {
      final result = await _newsService.getFavouriteNews(
        lastArticleID: lastID != null ? ArticleID.fromString(lastID) : null,
      );

      final articles = result.articles
          .map((e) => _mapster.map1(e, To<ArticleVM>()))
          .toList();

      String? newLastID;
      if (articles.isNotEmpty) {
        newLastID = articles.last.id;
      }

      emit(
        state.copyWith(
          isLoadingMore: false,
          canLoadMore: articles.isNotEmpty,
          lastArticleID: newLastID,
          articles: List.of(oldArticles)..addAll(articles),
        ),
      );
    } catch (e) {
      emit(state.withError('Error'));
      emit(
        state.copyWith(
          isLoadingMore: false,
          canLoadMore: false,
        ),
      );

      await Future.delayed(const Duration(seconds: 1)).then((_) {
        emit(
          state.copyWith(
            canLoadMore: true,
          ),
        );
      });
    }
  }

  void _pressArticle(
    _PressArticleEvent event,
    Emitter<FavouriteNewsState> emit,
  ) {
    _coordinator.onArticlePressed(articleID: event.id);
  }

  Future<void> _doublePressArticle(
    _DoublePressArticleEvent event,
    Emitter<FavouriteNewsState> emit,
  ) async {
    try {
      final articles = List.of(state.articles);

      final index = articles.indexWhere((e) => e.id == event.id);
      if (index == -1) {
        return;
      }

      final article = articles[index];

      if (article.isFavourite) {
        await _newsService.removeFromSaved(ArticleID.fromString(event.id));
      } else {
        await _newsService.save(ArticleID.fromString(event.id));
      }

      emit(
        state.copyWith(articles: articles..removeAt(index)),
      );
    } catch (e) {
      emit(
        state.withError('An error occurs during modifying favourite articles'),
      );
      emit(state.copyWith());
    }
  }

  void _updateArticle(
    _UpdateArticleEvent event,
    Emitter<FavouriteNewsState> emit,
  ) {
    final articles = List.of(state.articles);

    final index = articles.indexWhere((e) => e.id == event.article.id.value);
    if (index == -1) {
      return;
    }

    final updated = _mapster.map1(event.article, To<ArticleVM>());

    if (updated.isFavourite) {
      emit(
        state.copyWith(
          articles: articles..[index] = updated,
        ),
      );
    } else {
      emit(
        state.copyWith(
          articles: articles..removeAt(index),
        ),
      );
    }
  }
}
