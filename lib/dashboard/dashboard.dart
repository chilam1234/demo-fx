import 'package:demo_fx_project/dashboard/dashboard_provider.dart';
import 'package:demo_fx_project/service/api_client.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/top_instrument_item.dart';
import 'widget/watch_list_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<DashboardProvider>(
      create: (context) {
        final apiClient = context.read<ApiClient>();
        final service = StockService(apiClient);
        return DashboardProvider(service);
      },
      child: Scaffold(
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
        body: const _DashboardContent(),
      ),
    );
  }
}

class _DashboardContent extends StatefulWidget {
  const _DashboardContent({Key? key}) : super(key: key);

  @override
  State<_DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<_DashboardContent> {
  List<Widget> _buildGainerLoserList(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    return provider.watchList
        .map((instrument) => TopInstrumentItem(instrument: instrument))
        .toList();
  }

  List<Widget> _buildWatchList(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    return provider.watchList
        .map((instrument) => WatchListItem(instrument: instrument))
        .toList();
  }

  @override
  void initState() {
    final provider = context.read<DashboardProvider>();
    provider.fetchInstrument('TSLA'); // TODO: Hardcode for testing
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.apply(fontWeightDelta: 4, fontSizeDelta: 2);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            children: _buildGainerLoserList(context),
          ),
        ),
        ListTile(
          leading: Text(
            'Your watchlist',
            style: headerTextStyle,
          ),
        ),
        ..._buildWatchList(context)
      ],
    );
  }
}
