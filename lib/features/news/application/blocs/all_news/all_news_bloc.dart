import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/application/view_models/view_models.dart';

part 'all_news_event.dart';

part 'all_news_state.dart';

@injectable
class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(const AllNewsState()) {
    on<_LoadEvent>(_load);
  }

  Future<void> _load(
    _LoadEvent event,
    Emitter<AllNewsState> emit,
  ) async {}
}
