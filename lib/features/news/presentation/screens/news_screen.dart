import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/all_news/all_news_bloc.dart';
import '../../application/blocs/top_news/top_news_bloc.dart';

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
                  TopNewsBloc()..add(const TopNewsEvent.load()),
            ),
            BlocProvider<AllNewsBloc>(
              create: (context) =>
                  AllNewsBloc()..add(const AllNewsEvent.load()),
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

    return TabBarView(
      children: [
        BlocBuilder<TopNewsBloc, TopNewsState>(
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
            );
          },
        ),
        BlocBuilder<AllNewsBloc, AllNewsState>(
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
            );
          },
        ),
      ],
    );
  }
}
