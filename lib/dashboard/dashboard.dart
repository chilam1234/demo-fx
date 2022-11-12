import 'widget/top_instrument_item.dart';
import 'widget/watch_list_item.dart';
import 'package:demo_fx_project/model/Instrument.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const dummyInstrument = [
    Instrument(name: 'Tesla', price: 855.9, priceChange: 8),
    Instrument(name: 'GameStep', price: 855.9, priceChange: -2),
  ];

  List<Widget> _buildInstrumentList() {
    return dummyInstrument
        .map((instrument) => TopInstrumentItem(instrument: instrument))
        .toList();
  }

  List<Widget> _buildWatchList() {
    return dummyInstrument
        .map((instrument) => WatchListItem(instrument: instrument))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.apply(fontWeightDelta: 4, fontSizeDelta: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          ListTile(
            leading: Text(
              'Gainers and Losers',
              style: headerTextStyle,
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _buildInstrumentList(),
            ),
          ),
          ListTile(
            leading: Text(
              'Your watchlist',
              style: headerTextStyle,
            ),
          ),
          ..._buildWatchList()
        ],
      ),
    );
  }
}
