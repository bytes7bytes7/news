import '../entities/article/article.dart';
import '../value_objects/news_result/news_result.dart';

abstract class NewsRepository {
  const NewsRepository();

  Future<NewsResult> getTopNews({
    required String category,
    required int page,
    required int pageSize,
  });

  Future<void> cacheAll(List<Article> articles);
}
