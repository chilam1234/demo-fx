import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/scene/instrument/instrument_screen_provider.dart';
import 'package:demo_fx_project/scene/instrument/widget/instrument_new_feed_item.dart';
import 'package:demo_fx_project/scene/instrument/widget/stock_chart.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:demo_fx_project/service/user_setting_service.dart';
import 'package:demo_fx_project/util/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/instrument_base_info.dart';

class InstrumentScreen extends StatefulWidget {
  final Instrument instrument;

  const InstrumentScreen({
    Key? key,
    required this.instrument,
  }) : super(key: key);

  @override
  State<InstrumentScreen> createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> {
  late InstrumentScreenProvider provider;

  void _fetchStockData() {
    provider.fetchData(widget.instrument);
  }

  @override
  void initState() {
    final _service = context.read<StockService>();
    provider = InstrumentScreenProvider(_service, widget.instrument);

    super.initState();
    _fetchStockData();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userSetting = context.watch<UserSettingService>();
    final instrumentNmae = widget.instrument.name;
    final isFavourite = userSetting.watchingInstrument.contains(instrumentNmae);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.instrument.name),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              isFavourite
                  ? userSetting.unwatchInstrument(instrumentNmae)
                  : userSetting.watchInstrument(instrumentNmae);
            },
            icon: Icon(
              Icons.star,
              color:
                  isFavourite ? Colors.yellow.shade800 : Colors.grey.shade400,
            ),
          )
        ],
      ),
      body: ListenableProvider.value(
        value: provider,
        child: const InstrumentScreenContent(),
      ),
    );
  }
}

class InstrumentScreenContent extends StatelessWidget {
  const InstrumentScreenContent({Key? key}) : super(key: key);

  Widget _buildChart(BuildContext context, InstrumentScreenProvider provider) {
    final theme = Theme.of(context).extension<InstrumentStyle>();
    Color tintColor;
    if ((provider.instrument.priceChange ?? 0) > 0) {
      tintColor = theme?.gain ?? Colors.green;
    } else {
      tintColor = theme?.loss ?? Colors.red;
    }

    final stockData = provider.stockData;
    if (stockData == null) {
      if (provider.isFetchError) {
        return Container(
          color: Colors.grey.shade100,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Unable to fetch data, please try again later'),
                TextButton(
                    onPressed: () {
                      provider.refresh();
                    },
                    child: const Text('Retry'))
              ],
            ),
          ),
        );
      } else {
        return Container(
          color: Colors.grey.shade100,
          child: const Center(
            child: SizedBox(
              width: 32,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
    } else {
      return StockChart(candleStick: stockData, tintColor: tintColor);
    }
  }

  List<Widget> _buildNewsFeedList(
      BuildContext context, InstrumentScreenProvider provider) {
    final news = provider.news;

    if (news != null) {
      return news.map((news) => InstrumentNewFeedItem(newsFeed: news)).toList();
    } else if (provider.isFetchError) {
      return const [
        Text('Something get wrong when fetching news, please try again later')
      ];
    } else {
      return const [Text('No news available')];
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InstrumentScreenProvider>();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          const InstrumentBaseInfo(),
          const SizedBox(height: 24),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: _buildChart(context, provider),
            height: 260,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 12),
            child: Text('News', style: theme.textTheme.titleLarge),
          ),
          ..._buildNewsFeedList(context, provider)
        ],
      ),
    );
  }
}
