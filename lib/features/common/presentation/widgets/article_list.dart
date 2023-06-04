import 'package:flutter/material.dart';

import '../../application/view_models/view_models.dart';
import 'article_card.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.isLoadingMore,
    required this.canLoadMore,
    required this.loadMore,
    required this.onRefresh,
    required this.onArticleTap,
    required this.onArticleDoubleTap,
  });

  final List<ArticleVM> articles;
  final bool isLoadingMore;
  final bool canLoadMore;
  final VoidCallback loadMore;
  final VoidCallback onRefresh;
  final void Function(String) onArticleTap;
  final void Function(String) onArticleDoubleTap;

  @override
  Widget build(BuildContext context) {
    final itemCount = articles.length + 1;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          onRefresh();
        },
        child: ListView.separated(
          itemCount: itemCount,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            if (index == itemCount - 1) {
              if (isLoadingMore) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (canLoadMore) {
                loadMore();
              }

              return const SizedBox.shrink();
            }

            final article = articles[index];

            return ArticleCard(
              article: article,
              onTap: () => onArticleTap(article.id),
              onDoubleTap: () => onArticleDoubleTap(article.id),
            );
          },
        ),
      ),
    );
  }
}
