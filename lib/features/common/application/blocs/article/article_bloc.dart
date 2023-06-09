import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mapster/mapster.dart';

import '../../../domain/services/news_service.dart';
import '../../../domain/value_objects/article_id.dart';
import '../../coordinators/article_coordinator.dart';
import '../../view_models/article_vm/article_vm.dart';

part 'article_event.dart';

part 'article_state.dart';

@injectable
class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(
    this._newsService,
    this._coordinator,
    this._mapster,
  ) : super(const ArticleState()) {
    on<_SetIDEvent>(_setID);
    on<_LoadEvent>(_load);
    on<_PressBackEvent>(_pressBack);
    on<_PressFavouriteEvent>(_pressFavourite);
  }

  final NewsService _newsService;
  final ArticleCoordinator _coordinator;
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
      final articleOrNull =
          await _newsService.getByID(id: ArticleID.fromString(id));

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

  void _pressBack(
    _PressBackEvent event,
    Emitter<ArticleState> emit,
  ) {
    _coordinator.onBackPressed();
  }

  Future<void> _pressFavourite(
    _PressFavouriteEvent event,
    Emitter<ArticleState> emit,
  ) async {
    try {
      final article = state.article?.copyWith();

      if (article == null) {
        return;
      }

      if (article.isFavourite) {
        await _newsService.removeFromSaved(ArticleID.fromString(article.id));
      } else {
        await _newsService.save(ArticleID.fromString(article.id));
      }

      emit(
        state.copyWith(
          article: article.copyWith(
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
}
