import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../../../common/application/view_models/view_models.dart';
import '../../../../common/domain/services/services.dart';

part 'top_news_event.dart';

part 'top_news_state.dart';

@injectable
class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  TopNewsBloc(
    this._newsService,
    this._mapster,
  ) : super(const TopNewsState()) {
    on<_LoadEvent>(_load);
    on<_LoadMoreEvent>(_loadMore);
  }

  final NewsService _newsService;
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
}
