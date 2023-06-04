import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../application/blocs/article/article_bloc.dart';

const _appBarHeight = kToolbarHeight;
const _snackBarDuration = Duration(seconds: 2);
final _getIt = GetIt.instance;

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<ArticleBloc>()
        ..add(ArticleEvent.setID(id: id))
        ..add(const ArticleEvent.load()),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ArticleBloc>();

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => bloc.add(const ArticleEvent.pressBack()),
      ),
      centerTitle: true,
      title: const Text('Article'),
      actions: [
        BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            final article = state.article;

            if (article == null) {
              return const SizedBox.shrink();
            }

            return IconButton(
              icon: Icon(
                article.isFavourite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () => bloc.add(const ArticleEvent.pressFavourite()),
            );
          },
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final bloc = context.read<ArticleBloc>();

    return BlocConsumer<ArticleBloc, ArticleState>(
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

        final article = state.article;

        if (article == null) {
          return RefreshIndicator(
            onRefresh: () async => bloc.add(const ArticleEvent.load()),
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Center(
                    child: Text('Article not found'),
                  ),
                ),
              ],
            ),
          );
        }

        final imageUrlOrNull = article.imageUrl;

        return RefreshIndicator(
          onRefresh: () async => bloc.add(const ArticleEvent.load()),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.publishedAtFull,
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.title,
                      style: theme.textTheme.displaySmall,
                    ),
                    if (imageUrlOrNull != null) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox.fromSize(
                        size: const Size.fromHeight(200),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: imageUrlOrNull,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return ColoredBox(
                                color: theme.unselectedWidgetColor,
                                child: Icon(
                                  Icons.warning,
                                  color: theme.colorScheme.onBackground,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      article.content,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
