// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResult _$$_SearchResultFromJson(Map<String, dynamic> json) =>
    _$_SearchResult(
      symbol: json['1. symbol'] as String,
      name: json['2. name'] as String,
      type: json['3. type'] as String,
      region: json['4. region'] as String?,
      marketOpen: json['5. marketOpen'] as String?,
      marketClose: json['6. marketClose'] as String?,
      timezone: json['7. timezone'] as String?,
      currency: json['8. currency'] as String?,
      matchScore: json['9. matchScore'] as String?,
    );

Map<String, dynamic> _$$_SearchResultToJson(_$_SearchResult instance) =>
    <String, dynamic>{
      '1. symbol': instance.symbol,
      '2. name': instance.name,
      '3. type': instance.type,
      '4. region': instance.region,
      '5. marketOpen': instance.marketOpen,
      '6. marketClose': instance.marketClose,
      '7. timezone': instance.timezone,
      '8. currency': instance.currency,
      '9. matchScore': instance.matchScore,
    };
