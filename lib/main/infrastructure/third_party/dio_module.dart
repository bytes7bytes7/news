import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          queryParameters: {
            'apiKey': '38823f356abb4c6d9fa19f68dd78b40b',
          },
        ),
      );
}
