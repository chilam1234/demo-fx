import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  factory SearchResult({
    @JsonKey(name: '1. symbol') required String symbol,
    @JsonKey(name: '2. name') required String name,
    @JsonKey(name: '3. type') required String type,
    @JsonKey(name: '4. region') String? region,
    @JsonKey(name: '5. marketOpen') String? marketOpen,
    @JsonKey(name: '6. marketClose') String? marketClose,
    @JsonKey(name: '7. timezone') String? timezone,
    @JsonKey(name: '8. currency') String? currency,
    @JsonKey(name: '9. matchScore') String? matchScore,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
