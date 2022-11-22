// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) {
  return _NewsFeed.fromJson(json);
}

/// @nodoc
mixin _$NewsFeed {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_published')
  DateTime? get timePublished => throw _privateConstructorUsedError;
  @JsonKey(name: 'banner_image')
  String? get bannerImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsFeedCopyWith<NewsFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFeedCopyWith<$Res> {
  factory $NewsFeedCopyWith(NewsFeed value, $Res Function(NewsFeed) then) =
      _$NewsFeedCopyWithImpl<$Res, NewsFeed>;
  @useResult
  $Res call(
      {String title,
      String url,
      @JsonKey(name: 'time_published') DateTime? timePublished,
      @JsonKey(name: 'banner_image') String? bannerImage});
}

/// @nodoc
class _$NewsFeedCopyWithImpl<$Res, $Val extends NewsFeed>
    implements $NewsFeedCopyWith<$Res> {
  _$NewsFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? timePublished = freezed,
    Object? bannerImage = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      timePublished: freezed == timePublished
          ? _value.timePublished
          : timePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsFeedCopyWith<$Res> implements $NewsFeedCopyWith<$Res> {
  factory _$$_NewsFeedCopyWith(
          _$_NewsFeed value, $Res Function(_$_NewsFeed) then) =
      __$$_NewsFeedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String url,
      @JsonKey(name: 'time_published') DateTime? timePublished,
      @JsonKey(name: 'banner_image') String? bannerImage});
}

/// @nodoc
class __$$_NewsFeedCopyWithImpl<$Res>
    extends _$NewsFeedCopyWithImpl<$Res, _$_NewsFeed>
    implements _$$_NewsFeedCopyWith<$Res> {
  __$$_NewsFeedCopyWithImpl(
      _$_NewsFeed _value, $Res Function(_$_NewsFeed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? timePublished = freezed,
    Object? bannerImage = freezed,
  }) {
    return _then(_$_NewsFeed(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      timePublished: freezed == timePublished
          ? _value.timePublished
          : timePublished // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsFeed implements _NewsFeed {
  _$_NewsFeed(
      {required this.title,
      required this.url,
      @JsonKey(name: 'time_published') this.timePublished,
      @JsonKey(name: 'banner_image') this.bannerImage});

  factory _$_NewsFeed.fromJson(Map<String, dynamic> json) =>
      _$$_NewsFeedFromJson(json);

  @override
  final String title;
  @override
  final String url;
  @override
  @JsonKey(name: 'time_published')
  final DateTime? timePublished;
  @override
  @JsonKey(name: 'banner_image')
  final String? bannerImage;

  @override
  String toString() {
    return 'NewsFeed(title: $title, url: $url, timePublished: $timePublished, bannerImage: $bannerImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsFeed &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.timePublished, timePublished) ||
                other.timePublished == timePublished) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, timePublished, bannerImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsFeedCopyWith<_$_NewsFeed> get copyWith =>
      __$$_NewsFeedCopyWithImpl<_$_NewsFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsFeedToJson(
      this,
    );
  }
}

abstract class _NewsFeed implements NewsFeed {
  factory _NewsFeed(
      {required final String title,
      required final String url,
      @JsonKey(name: 'time_published') final DateTime? timePublished,
      @JsonKey(name: 'banner_image') final String? bannerImage}) = _$_NewsFeed;

  factory _NewsFeed.fromJson(Map<String, dynamic> json) = _$_NewsFeed.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(name: 'time_published')
  DateTime? get timePublished;
  @override
  @JsonKey(name: 'banner_image')
  String? get bannerImage;
  @override
  @JsonKey(ignore: true)
  _$$_NewsFeedCopyWith<_$_NewsFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
