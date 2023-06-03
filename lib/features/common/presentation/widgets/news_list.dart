import 'package:flutter/material.dart';

import '../../application/view_models/view_models.dart';
import 'news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({
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

          return NewsCard(
            article: article,
            onTap: () {},
            onDoubleTap: () {},
          );
        },
      ),
    );
  }
}
