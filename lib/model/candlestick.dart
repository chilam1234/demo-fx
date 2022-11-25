import 'package:freezed_annotation/freezed_annotation.dart';

part 'candlestick.freezed.dart';

@freezed
class Candlestick with _$Candlestick {
  const factory Candlestick({
    required DateTime time,
    required num open,
    required num high,
    required num low,
    required num close,
    required num volume
  }) = _Candlestick;
}
