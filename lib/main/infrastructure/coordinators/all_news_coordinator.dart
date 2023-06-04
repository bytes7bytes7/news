import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../features/common/presentation/screens/article_screen.dart';
import '../../../features/news/application/coordinators/all_news_coordinator.dart';
import '../../../utils/typedef.dart';

@Singleton(as: AllNewsCoordinator)
class ProdAllNewsCoordinator implements AllNewsCoordinator {
  const ProdAllNewsCoordinator(this._navigatorKey);

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
