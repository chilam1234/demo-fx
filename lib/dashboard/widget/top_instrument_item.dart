import 'package:demo_fx_project/shared_widget/gain_loss_view.dart';
import 'package:flutter/material.dart';

import 'package:demo_fx_project/model/Instrument.dart';
import '../../shared_widget/instrument_icon.dart';

class TopInstrumentItem extends StatelessWidget {
  final Instrument instrument;

  const TopInstrumentItem({Key? key, required this.instrument})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              InstrumentIcon(
                instrument: instrument,
                size: 32,
              ),
              const SizedBox(height: 16),
              Text(
                instrument.name,
                style: theme.textTheme.titleMedium
                    ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                '\$${instrument.price}',
                style: theme.textTheme.bodyMedium
                    ?.merge(const TextStyle(fontWeight: FontWeight.w500)),
              ),
              const Spacer(),
              GainLossView(pricePercentageChange: instrument.priceChange ?? 0),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
