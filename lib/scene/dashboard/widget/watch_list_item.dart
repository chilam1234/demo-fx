import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/service/user_setting_service.dart';
import 'package:demo_fx_project/shared_widget/gain_loss_view.dart';
import 'package:demo_fx_project/shared_widget/instrument_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum WatchListItemMenu { remove }

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

    String priceText = '--';
    if (instrument.price != null) {
      priceText = '\$${instrument.price}';
    }
    return Card(
      child: SizedBox(
        height: 64,
        child: ListTile(
          leading: InstrumentIcon(
            name: instrument.name,
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
                  GainLossView(pricePercentageChange: instrument.priceChange),
                ],
              ),
              const Spacer(),
              Text(
                priceText,
                style: priceTextStyle,
              )
            ],
          ),
          trailing: PopupMenuButton<WatchListItemMenu>(
            onSelected: (item) {
              switch (item) {
                case WatchListItemMenu.remove:
                  final service = context.read<UserSettingService>();
                  service.unwatchInstrument(instrument.name);
                  break;
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<WatchListItemMenu>>[
              const PopupMenuItem(
                child: Text('Remove'),
                value: WatchListItemMenu.remove,
              )
            ],
          ),
        ),
      ),
    );
  }
}
