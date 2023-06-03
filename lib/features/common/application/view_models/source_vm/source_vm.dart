import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_vm.freezed.dart';

@freezed
class SourceVM with _$SourceVM {
  const factory SourceVM({
    required String? id,
    required String name,
  }) = _SourceVM;
}
