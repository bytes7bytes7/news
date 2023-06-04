import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../features/common/presentation/screens/article_screen.dart';
import '../../../features/news/application/coordinators/top_news_coordinator.dart';
import '../../../utils/typedef.dart';

@Singleton(as: TopNewsCoordinator)
class ProdTopNewsCoordinator implements TopNewsCoordinator {
  const ProdTopNewsCoordinator(this._navigatorKey);

  final NavigatorKey _navigatorKey;

  @override
  void onArticlePressed({required String articleID}) {
    Navigator.of(_navigatorKey.currentState!.context).push(
      MaterialPageRoute(
        builder: (context) {
          return ArticleScreen(
            id: articleID,
          );
        },
      ),
    );
  }
}
