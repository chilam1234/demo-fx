import 'package:demo_fx_project/util/theme_extension.dart';
import 'package:flutter/material.dart';

class GainLossView extends StatelessWidget {
  final num? pricePercentageChange;

  const GainLossView({
    Key? key,
    this.pricePercentageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).extension<InstrumentStyle>()!;
    Color? color = Colors.grey;
    final pricePercentageChange = this.pricePercentageChange;
    if (pricePercentageChange != null && pricePercentageChange != 0) {
      color = pricePercentageChange > 0 ? style.gain : style.loss;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color?.withAlpha(50),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      child: Text(
        pricePercentageChange != null ? '$pricePercentageChange%' : '--',
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
