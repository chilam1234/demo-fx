import 'package:demo_fx_project/shared_widget/gain_loss_view.dart';
import 'package:flutter/material.dart';
import 'package:demo_fx_project/scene/instrument/instrument_screen_provider.dart';
import 'package:provider/provider.dart';

class InstrumentBaseInfo extends StatelessWidget {
  const InstrumentBaseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InstrumentScreenProvider>();
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(
          '\$${provider.instrument.price?.toString() ?? '---'}',
          style: theme.textTheme.titleLarge?.apply(fontWeightDelta: 2, fontSizeDelta: 6),
        ),
        const SizedBox(width: 12),
        GainLossView(pricePercentageChange: provider.instrument.priceChange),
      ],
    );
  }
}
