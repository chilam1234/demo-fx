import 'candlestick.dart';

class Instrument {
  final String name;
  final List<Candlestick> timeSeries;
  num? get price => timeSeries.first.close;
  num? get priceChange => 0; // TODO: need to find out how to get it

  const Instrument({
    required this.name,
    required this.timeSeries
  });
}