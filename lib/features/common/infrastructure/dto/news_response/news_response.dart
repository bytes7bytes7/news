import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../article_response/article_response.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<ArticleResponse> articles;

  factory NewsResponse.fromJson(JsonMap json) => _$NewsResponseFromJson(json);

  JsonMap toJson() => _$NewsResponseToJson(this);
}
