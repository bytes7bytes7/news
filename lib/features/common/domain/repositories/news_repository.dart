import '../entities/article/article.dart';
import '../value_objects/article_id.dart';
import '../value_objects/news_result/news_result.dart';

abstract class NewsRepository {
  const NewsRepository();

  Future<void> init();

  Future<NewsResult> getTopNews({
    required String query,
    required int page,
    required int pageSize,
  });

  Future<NewsResult> getAllNews({
    required String query,
    required int page,
    required int pageSize,
  });

  Future<NewsResult> getFavouriteNews({
    required int pageSize,
    ArticleID? lastArticleID,
  });

  Future<void> cacheAll(List<Article> articles);

  Future<Article?> getByID(ArticleID id);

  Future<Article?> save(ArticleID id);

  Future<Article?> removeFromSaved(ArticleID id);
}
