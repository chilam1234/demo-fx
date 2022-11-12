import 'package:demo_fx_project/util/theme_extension.dart';
import 'package:flutter/material.dart';

class GainLossView extends StatelessWidget {
  final num pricePercentageChange;

  const GainLossView({
    Key? key,
    required this.pricePercentageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).extension<InstrumentStyle>()!;
    final color = pricePercentageChange > 0 ? style.gain : style.loss;
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
        '$pricePercentageChange%',
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
