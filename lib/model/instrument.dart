class Instrument {
  final String name;
  num? price;
  num? priceChange;

  Instrument({
    required this.name,
    this.price,
    this.priceChange,
  });
}