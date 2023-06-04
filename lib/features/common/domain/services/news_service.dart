import 'package:injectable/injectable.dart';

import '../exceptions/exceptions.dart';
import '../repositories/news_repository.dart';
import '../value_objects/news_result/news_result.dart';

const _query = 'apple';
const _pageSize = 15;

@singleton
class NewsService {
  const NewsService(
    this._newsRepository,
  );

  final NewsRepository _newsRepository;

  Future<NewsResult> getTopNews() async {
    try {
      final result = await _newsRepository.getTopNews(
        query: _query,
        pageSize: _pageSize,
      );

      await _newsRepository.cacheAll(result.articles);

      return result;
    } catch (e) {
      throw const TopNewsNotLoaded();
    }
  }
}
