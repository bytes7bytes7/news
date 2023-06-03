import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_news_event.dart';

part 'top_news_state.dart';

class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  TopNewsBloc() : super(const TopNewsState()) {
    on<_LoadTopNewsEvent>(_load);
  }

  Future<void> _load(
    _LoadTopNewsEvent event,
    Emitter<TopNewsState> emit,
  ) async {
    emit(state.withLoading());

    emit(state.withoutLoading());
  }
}
