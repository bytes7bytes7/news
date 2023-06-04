import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../env.dart';
import '../dto/news_response/news_response.dart';

@singleton
class NewsDataProvider {
  const NewsDataProvider(this._dio);

  final Dio _dio;

  Future<NewsResponse> getTopNews() async {
    final response = await _dio.getUri(
      Uri(
        scheme: Env.scheme,
        host: Env.host,
        path: Env.topNewsPath,
      ),
    );

    return NewsResponse.fromJson(response.data);
  }
}
