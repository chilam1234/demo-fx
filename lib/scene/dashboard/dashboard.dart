import 'package:demo_fx_project/service/user_setting_service.dart';
import 'package:go_router/go_router.dart';

import '../../service/auth.dart';
import 'dashboard_provider.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/top_instrument_item.dart';
import 'widget/watch_list_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  void _navigateSearchScene(BuildContext context) {
    GoRouter.of(context).push('/search');
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<DashboardProvider>(
      create: (context) {
        final service = context.read<StockService>();
        return DashboardProvider(service);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                _navigateSearchScene(context);
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Consumer<UserSettingService>(
          builder: (_, userSetting, child) => _DashboardContent(
            watchingInstrument: userSetting.watchingInstrument,
          ),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatefulWidget {
  final List<String>? watchingInstrument;

  const _DashboardContent({Key? key, this.watchingInstrument})
      : super(key: key);

  @override
  State<_DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<_DashboardContent> {
  List<Widget> _buildGainerLoserList(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final topList = provider.watchList;
    if (topList.isEmpty) {
      return [const Text('You watch list is empty')];
    } else {
      return topList
          .map(
            (instrument) => TopInstrumentItem(
              instrument: instrument,
              onClick: () {
                GoRouter.of(context).pushNamed('instrumentDetail',
                    params: {'instrumentName': instrument.name},
                    extra: instrument);
              },
            ),
          )
          .toList();
    }
  }

  List<Widget> _buildWatchList(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final watchList = provider.watchList;

    if (watchList.isEmpty) {
      return [const Text('You watch list is empty')];
    } else {
      return provider.watchList
          .map(
            (instrument) => WatchListItem(
              instrument: instrument,
              onClick: () {
                GoRouter.of(context).pushNamed('instrumentDetail',
                    params: {'instrumentName': instrument.name},
                    extra: instrument);
              },
            ),
          )
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInstrument();
  }

  @override
  void didUpdateWidget(covariant _DashboardContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.watchingInstrument != widget.watchingInstrument) {
      _fetchInstrument();
    }
  }

  void _fetchInstrument() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = context.read<DashboardProvider>();
      provider.fetchInstruments(widget.watchingInstrument);
    });
  }

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.apply(fontWeightDelta: 4, fontSizeDelta: 2);

    return RefreshIndicator(
      onRefresh: () async {
        final provider = context.read<DashboardProvider>();
        await provider.fetchInstruments(widget.watchingInstrument);
        return;
      },
      child: ListView(
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
      ),
    );
  }
}
