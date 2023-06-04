import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/article/article.dart';

part 'news_result.freezed.dart';

@freezed
class NewsResult with _$NewsResult {
  const factory NewsResult({
    required int totalResults,
    required List<Article> articles,
  }) = _NewsResult;
}
