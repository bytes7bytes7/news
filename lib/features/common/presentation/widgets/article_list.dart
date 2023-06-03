import 'package:flutter/material.dart';

import '../../application/view_models/view_models.dart';
import 'article_card.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
  });

  final List<ArticleVM> articles;

  @override
  Widget build(BuildContext context) {
    final itemCount = articles.length;

    return SafeArea(
      child: ListView.separated(
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          final article = articles[index];

          return ArticleCard(
            article: article,
            onTap: () {},
            onDoubleTap: () {},
          );
        },
      ),
    );
  }
}
