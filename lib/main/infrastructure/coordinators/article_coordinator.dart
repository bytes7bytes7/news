import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../features/common/application/coordinators/article_coordinator.dart';
import '../../../features/news/presentation/screens/news_screen.dart';
import '../../../utils/typedef.dart';

@Singleton(as: ArticleCoordinator)
class ProdArticleCoordinator implements ArticleCoordinator {
  const ProdArticleCoordinator(this._navigatorKey);

  final NavigatorKey _navigatorKey;

  @override
  void onBackPressed() {
    final navigator = Navigator.of(_navigatorKey.currentState!.context);

    if (navigator.canPop()) {
      navigator.pop();
    } else {
      navigator
        ..popUntil((route) => false)
        ..push(
          MaterialPageRoute(
            builder: (context) {
              return const NewsScreen();
            },
          ),
        );
    }
  }
}
