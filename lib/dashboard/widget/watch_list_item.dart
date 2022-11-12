import 'package:demo_fx_project/model/Instrument.dart';
import 'package:demo_fx_project/shared_widget/gain_loss_view.dart';
import 'package:demo_fx_project/shared_widget/instrument_icon.dart';
import 'package:flutter/material.dart';

class WatchListItem extends StatelessWidget {
  final Instrument instrument;

  const WatchListItem({
    Key? key,
    required this.instrument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    const priceTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

    return Card(
      child: SizedBox(
        height: 64,
        child: ListTile(
          leading: InstrumentIcon(
            instrument: instrument,
            size: 32,
          ),
          title: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instrument.name,
                    style: titleTextStyle,
                  ),
                  const SizedBox(height: 2),
                  GainLossView(pricePercentageChange: instrument.priceChange ?? 0),
                ],
              ),
              const Spacer(),
              Text(
                '\$${instrument.price}',
                style: priceTextStyle,
              )
            ],
          ),
          trailing: const Icon(Icons.more_vert, size: 18),
        ),
      ),
    );
  }
}
