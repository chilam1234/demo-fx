import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_feed.freezed.dart';
part 'news_feed.g.dart';

@freezed
class NewsFeed with _$NewsFeed {
  factory NewsFeed({
    required String title,
    required String url,
    @JsonKey(name: 'time_published') DateTime? timePublished,
    @JsonKey(name: 'banner_image') String? bannerImage,
  }) = _NewsFeed;

  factory NewsFeed.fromJson(Map<String, dynamic> json) => _$NewsFeedFromJson(json);
}