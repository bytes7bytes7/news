import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/application/view_models/view_models.dart';

part 'top_news_event.dart';

part 'top_news_state.dart';

class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  TopNewsBloc() : super(const TopNewsState()) {
    on<_LoadEvent>(_load);
  }

  Future<void> _load(
    _LoadEvent event,
    Emitter<TopNewsState> emit,
  ) async {
    emit(state.withLoading());

    try {
      emit(state.copyWith());
    } catch (e) {
      emit(state.withError('Error'));
      emit(state.copyWith());
    }
  }
}
