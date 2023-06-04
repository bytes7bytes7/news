// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsResult {
  int get totalResults => throw _privateConstructorUsedError;
  List<Article> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsResultCopyWith<NewsResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResultCopyWith<$Res> {
  factory $NewsResultCopyWith(
          NewsResult value, $Res Function(NewsResult) then) =
      _$NewsResultCopyWithImpl<$Res, NewsResult>;
  @useResult
  $Res call({int totalResults, List<Article> articles});
}

/// @nodoc
class _$NewsResultCopyWithImpl<$Res, $Val extends NewsResult>
    implements $NewsResultCopyWith<$Res> {
  _$NewsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsResultCopyWith<$Res>
    implements $NewsResultCopyWith<$Res> {
  factory _$$_NewsResultCopyWith(
          _$_NewsResult value, $Res Function(_$_NewsResult) then) =
      __$$_NewsResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalResults, List<Article> articles});
}

/// @nodoc
class __$$_NewsResultCopyWithImpl<$Res>
    extends _$NewsResultCopyWithImpl<$Res, _$_NewsResult>
    implements _$$_NewsResultCopyWith<$Res> {
  __$$_NewsResultCopyWithImpl(
      _$_NewsResult _value, $Res Function(_$_NewsResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_$_NewsResult(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$_NewsResult implements _NewsResult {
  const _$_NewsResult(
      {required this.totalResults, required final List<Article> articles})
      : _articles = articles;

  @override
  final int totalResults;
  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'NewsResult(totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResult &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsResultCopyWith<_$_NewsResult> get copyWith =>
      __$$_NewsResultCopyWithImpl<_$_NewsResult>(this, _$identity);
}

abstract class _NewsResult implements NewsResult {
  const factory _NewsResult(
      {required final int totalResults,
      required final List<Article> articles}) = _$_NewsResult;

  @override
  int get totalResults;
  @override
  List<Article> get articles;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResultCopyWith<_$_NewsResult> get copyWith =>
      throw _privateConstructorUsedError;
}
