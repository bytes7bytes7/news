import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/favourite_news/favourite_news_bloc.dart';

const _snackBarDuration = Duration(seconds: 2);
final _getIt = GetIt.instance;

class FavouriteNewsScreen extends StatelessWidget {
  const FavouriteNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<FavouriteNewsBloc>(),
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavouriteNewsBloc>();

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return BlocConsumer<FavouriteNewsBloc, FavouriteNewsState>(
      listener: (context, state) {
        if (state.hasError) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              duration: _snackBarDuration,
              content: Text(
                state.error,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.articles.isEmpty) {
          return EmptyArticlesList(
            onRefresh: () => bloc.add(const FavouriteNewsEvent.load()),
          );
        }

        return ArticleList(
          articles: state.articles,
          isLoadingMore: state.isLoadingMore,
          canLoadMore: state.canLoadMore,
          loadMore: () => bloc.add(const FavouriteNewsEvent.loadMore()),
          onRefresh: () => bloc.add(const FavouriteNewsEvent.load()),
          onArticleTap: (id) =>
              bloc.add(FavouriteNewsEvent.pressArticle(id: id)),
          onArticleDoubleTap: (id) =>
              bloc.add(FavouriteNewsEvent.doublePressArticle(id: id)),
        );
      },
    );
  }
}
