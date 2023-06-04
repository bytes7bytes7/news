import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../source_response/source_response.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  const ArticleResponse({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final SourceResponse source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  factory ArticleResponse.fromJson(JsonMap json) =>
      _$ArticleResponseFromJson(json);

  JsonMap toJson() => _$ArticleResponseToJson(this);
}
