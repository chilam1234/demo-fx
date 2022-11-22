// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsFeed _$$_NewsFeedFromJson(Map<String, dynamic> json) => _$_NewsFeed(
      title: json['title'] as String,
      url: json['url'] as String,
      timePublished: json['time_published'] == null
          ? null
          : DateTime.parse(json['time_published'] as String),
      bannerImage: json['banner_image'] as String?,
    );

Map<String, dynamic> _$$_NewsFeedToJson(_$_NewsFeed instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'time_published': instance.timePublished?.toIso8601String(),
      'banner_image': instance.bannerImage,
    };
