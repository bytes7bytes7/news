import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../../../common/application/view_models/view_models.dart';
import '../../../../common/domain/entities/article/article.dart';
import '../../../../common/domain/events/news_event.dart';
import '../../../../common/domain/services/services.dart';
import '../../../../common/domain/value_objects/article_id.dart';
import '../../coordinators/top_news_coordinator.dart';

part 'top_news_event.dart';

part 'top_news_state.dart';

@singleton
class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  TopNewsBloc(
    this._newsService,
    this._coordinator,
    this._mapster,
  ) : super(const TopNewsState()) {
    on<_LoadEvent>(_load);
    on<_LoadMoreEvent>(_loadMore);
    on<_PressArticleEvent>(_pressArticle);
    on<_DoublePressArticleEvent>(_doublePressArticle);

    on<_UpdateArticleEvent>(_updateArticle);

    _newsService.events.listen((event) {
      if (event is ArticleUpdatedNewsEvent) {
        add(TopNewsEvent._updateArticle(event.article));
      }
    });
  }

  final NewsService _newsService;
  final TopNewsCoordinator _coordinator;
  final Mapster _mapster;

  Future<void> _load(
    _LoadEvent event,
    Emitter<TopNewsState> emit,
  ) async {
    emit(state.withLoading());

    try {
      final result = await _newsService.getTopNews(
        page: 0,
      );

      final articles = result.articles
          .map((e) => _mapster.map1(e, To<ArticleVM>()))
          .toList();

      emit(
        state.copyWith(
          page: 0,
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
    Emitter<TopNewsState> emit,
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

    final page = state.page + 1;

    try {
      final result = await _newsService.getTopNews(
        page: page,
      );

      final articles = result.articles
          .map((e) => _mapster.map1(e, To<ArticleVM>()))
          .toList();

      emit(
        state.copyWith(
          isLoadingMore: false,
          canLoadMore: articles.isNotEmpty,
          page: page,
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
    Emitter<TopNewsState> emit,
  ) {
    _coordinator.onArticlePressed(articleID: event.id);
  }

  Future<void> _doublePressArticle(
    _DoublePressArticleEvent event,
    Emitter<TopNewsState> emit,
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
        state.copyWith(
          articles: articles
            ..[index] = article.copyWith(
              isFavourite: !article.isFavourite,
            ),
        ),
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
    Emitter<TopNewsState> emit,
  ) {
    final articles = List.of(state.articles);

    final index = articles.indexWhere((e) => e.id == event.article.id.value);
    if (index == -1) {
      return;
    }

    final updated = _mapster.map1(event.article, To<ArticleVM>());

    emit(
      state.copyWith(
        articles: articles..[index] = updated,
      ),
    );
  }
}
