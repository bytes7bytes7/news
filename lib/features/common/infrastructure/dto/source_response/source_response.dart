import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'source_response.g.dart';

@JsonSerializable()
class SourceResponse {
  const SourceResponse({
    required this.id,
    required this.name,
  });

  final String? id;
  final String name;

  factory SourceResponse.fromJson(JsonMap json) =>
      _$SourceResponseFromJson(json);

  JsonMap toJson() => _$SourceResponseToJson(this);
}
