// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SourceVM {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceVMCopyWith<SourceVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceVMCopyWith<$Res> {
  factory $SourceVMCopyWith(SourceVM value, $Res Function(SourceVM) then) =
      _$SourceVMCopyWithImpl<$Res, SourceVM>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$SourceVMCopyWithImpl<$Res, $Val extends SourceVM>
    implements $SourceVMCopyWith<$Res> {
  _$SourceVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SourceVMCopyWith<$Res> implements $SourceVMCopyWith<$Res> {
  factory _$$_SourceVMCopyWith(
          _$_SourceVM value, $Res Function(_$_SourceVM) then) =
      __$$_SourceVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$_SourceVMCopyWithImpl<$Res>
    extends _$SourceVMCopyWithImpl<$Res, _$_SourceVM>
    implements _$$_SourceVMCopyWith<$Res> {
  __$$_SourceVMCopyWithImpl(
      _$_SourceVM _value, $Res Function(_$_SourceVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$_SourceVM(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SourceVM implements _SourceVM {
  const _$_SourceVM({required this.id, required this.name});

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString() {
    return 'SourceVM(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SourceVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SourceVMCopyWith<_$_SourceVM> get copyWith =>
      __$$_SourceVMCopyWithImpl<_$_SourceVM>(this, _$identity);
}

abstract class _SourceVM implements SourceVM {
  const factory _SourceVM(
      {required final String? id, required final String name}) = _$_SourceVM;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SourceVMCopyWith<_$_SourceVM> get copyWith =>
      throw _privateConstructorUsedError;
}
