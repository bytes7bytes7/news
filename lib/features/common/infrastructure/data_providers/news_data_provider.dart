import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../env.dart';
import '../dto/news_response/news_response.dart';

@singleton
class NewsDataProvider {
  const NewsDataProvider(this._dio);

  final Dio _dio;

  Future<NewsResponse> getTopNews({
    required String query,
    required int pageSize,
  }) async {
    final response = await _dio.getUri(
      Uri(
        scheme: Env.scheme,
        host: Env.host,
        path: Env.topNewsPath,
        queryParameters: <String, String>{
          'apiKey': Env.apiKey,
          'q': query,
          'pageSize': '$pageSize',
        },
      ),
    );

    return NewsResponse.fromJson(response.data);
  }
}
