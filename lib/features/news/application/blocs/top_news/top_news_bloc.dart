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
  }

  final NewsService _newsService;
  final Mapster _mapster;

  Future<void> _load(
    _LoadEvent event,
    Emitter<TopNewsState> emit,
  ) async {
    emit(state.withLoading());

    try {
      final result = await _newsService.getTopNews();

      final articles = result.articles
          .map((e) => _mapster.map1(e, To<ArticleVM>()))
          .toList();

      emit(
        state.copyWith(
          isLoading: false,
          articles: articles,
        ),
      );
    } catch (e) {
      emit(state.withError('Error'));
      emit(state.copyWith());
    }
  }
}
