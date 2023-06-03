import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/article_vm/article_vm.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleState()) {
    on<_LoadEvent>(_load);
  }

  Future<void> _load(
    _LoadEvent event,
    Emitter<ArticleState> emit,
  ) async {}
}
