class Instrument {
  final String name;
  final num? price;
  final num? priceChange;

  const Instrument({
    required this.name,
    this.price,
    this.priceChange,
  });
}