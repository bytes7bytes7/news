import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/all_news/all_news_bloc.dart';
import '../../application/blocs/top_news/top_news_bloc.dart';

const _snackBarDuration = Duration(seconds: 2);
final _getIt = GetIt.instance;

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'News',
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Top',
              ),
              Tab(
                text: 'All',
              ),
            ],
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<TopNewsBloc>(
              create: (context) =>
                  _getIt.get<TopNewsBloc>()..add(const TopNewsEvent.load()),
            ),
            BlocProvider<AllNewsBloc>(
              create: (context) =>
                  _getIt.get<AllNewsBloc>()..add(const AllNewsEvent.load()),
            ),
          ],
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final topNewsBloc = context.read<TopNewsBloc>();
    final allNewsBloc = context.read<AllNewsBloc>();

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return TabBarView(
      children: [
        BlocConsumer<TopNewsBloc, TopNewsState>(
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
                onRefresh: () => topNewsBloc.add(const TopNewsEvent.load()),
              );
            }

            return ArticleList(
              articles: state.articles,
              isLoadingMore: state.isLoadingMore,
              canLoadMore: state.canLoadMore,
              loadMore: () => topNewsBloc.add(const TopNewsEvent.loadMore()),
              onRefresh: () => topNewsBloc.add(const TopNewsEvent.load()),
            );
          },
        ),
        BlocConsumer<AllNewsBloc, AllNewsState>(
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
                onRefresh: () => allNewsBloc.add(const AllNewsEvent.load()),
              );
            }

            return ArticleList(
              articles: state.articles,
              isLoadingMore: state.isLoadingMore,
              canLoadMore: state.canLoadMore,
              loadMore: () => allNewsBloc.add(const AllNewsEvent.loadMore()),
              onRefresh: () => allNewsBloc.add(const AllNewsEvent.load()),
            );
          },
        ),
      ],
    );
  }
}
