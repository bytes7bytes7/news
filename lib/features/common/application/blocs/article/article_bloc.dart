import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../../domain/services/news_service.dart';
import '../../view_models/article_vm/article_vm.dart';

part 'article_event.dart';

part 'article_state.dart';

@injectable
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(
    this._newsService,
    this._mapster,
  ) : super(const ArticleState()) {
    on<_SetIDEvent>(_setID);
    on<_LoadEvent>(_load);
  }

  final NewsService _newsService;
  final Mapster _mapster;

  void _setID(
    _SetIDEvent event,
    Emitter<ArticleState> emit,
  ) {
    emit(state.copyWith(articleID: event.id));
  }

  Future<void> _load(
    _LoadEvent event,
    Emitter<ArticleState> emit,
  ) async {
    final id = state.articleID;

    if (id == null) {
      emit(state.withError('ID is not set'));
      emit(state.copyWith());
      return;
    }

    emit(state.withLoading());

    try {
      final articleOrNull = await _newsService.getByID(id: id);

      if (articleOrNull == null) {
        emit(
          state.copyWith(
            isLoading: false,
            error: 'Article not found',
          ),
        );

        emit(state.copyWith());

        return;
      }

      emit(
        state.copyWith(
          isLoading: false,
          article: _mapster.map1(articleOrNull, To<ArticleVM>()),
        ),
      );
    } catch (e) {
      emit(state.withError('Error'));
      emit(state.copyWith());
    }
  }
}
