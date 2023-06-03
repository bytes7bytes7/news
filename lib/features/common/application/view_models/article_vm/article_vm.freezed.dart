// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleVM {
  SourceVM get source => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleVMCopyWith<ArticleVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleVMCopyWith<$Res> {
  factory $ArticleVMCopyWith(ArticleVM value, $Res Function(ArticleVM) then) =
      _$ArticleVMCopyWithImpl<$Res, ArticleVM>;
  @useResult
  $Res call(
      {SourceVM source,
      String? author,
      String title,
      String? description,
      String url,
      String? imageUrl,
      String publishedAt,
      String content});

  $SourceVMCopyWith<$Res> get source;
}

/// @nodoc
class _$ArticleVMCopyWithImpl<$Res, $Val extends ArticleVM>
    implements $ArticleVMCopyWith<$Res> {
  _$ArticleVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? url = null,
    Object? imageUrl = freezed,
    Object? publishedAt = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceVM,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceVMCopyWith<$Res> get source {
    return $SourceVMCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArticleVMCopyWith<$Res> implements $ArticleVMCopyWith<$Res> {
  factory _$$_ArticleVMCopyWith(
          _$_ArticleVM value, $Res Function(_$_ArticleVM) then) =
      __$$_ArticleVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SourceVM source,
      String? author,
      String title,
      String? description,
      String url,
      String? imageUrl,
      String publishedAt,
      String content});

  @override
  $SourceVMCopyWith<$Res> get source;
}

/// @nodoc
class __$$_ArticleVMCopyWithImpl<$Res>
    extends _$ArticleVMCopyWithImpl<$Res, _$_ArticleVM>
    implements _$$_ArticleVMCopyWith<$Res> {
  __$$_ArticleVMCopyWithImpl(
      _$_ArticleVM _value, $Res Function(_$_ArticleVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? url = null,
    Object? imageUrl = freezed,
    Object? publishedAt = null,
    Object? content = null,
  }) {
    return _then(_$_ArticleVM(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceVM,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ArticleVM implements _ArticleVM {
  const _$_ArticleVM(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.imageUrl,
      required this.publishedAt,
      required this.content});

  @override
  final SourceVM source;
  @override
  final String? author;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String url;
  @override
  final String? imageUrl;
  @override
  final String publishedAt;
  @override
  final String content;

  @override
  String toString() {
    return 'ArticleVM(source: $source, author: $author, title: $title, description: $description, url: $url, imageUrl: $imageUrl, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleVM &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, author, title,
      description, url, imageUrl, publishedAt, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleVMCopyWith<_$_ArticleVM> get copyWith =>
      __$$_ArticleVMCopyWithImpl<_$_ArticleVM>(this, _$identity);
}

abstract class _ArticleVM implements ArticleVM {
  const factory _ArticleVM(
      {required final SourceVM source,
      required final String? author,
      required final String title,
      required final String? description,
      required final String url,
      required final String? imageUrl,
      required final String publishedAt,
      required final String content}) = _$_ArticleVM;

  @override
  SourceVM get source;
  @override
  String? get author;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get url;
  @override
  String? get imageUrl;
  @override
  String get publishedAt;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleVMCopyWith<_$_ArticleVM> get copyWith =>
      throw _privateConstructorUsedError;
}
