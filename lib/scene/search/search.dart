import 'package:demo_fx_project/model/search_result.dart';
import 'package:demo_fx_project/scene/search/search_provider.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:demo_fx_project/service/user_setting_service.dart';
import 'package:demo_fx_project/shared_widget/instrument_icon.dart';
import 'package:demo_fx_project/util/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchInstrument extends StatefulWidget {
  const SearchInstrument({Key? key}) : super(key: key);

  @override
  State<SearchInstrument> createState() => _SearchInstrumentState();
}

class _SearchInstrumentState extends State<SearchInstrument> {
  final Debouncer _inputDebouncer = Debouncer(200);
  late SearchProvider _searchProvider;

  @override
  void initState() {
    final service = context.read<StockService>();
    _searchProvider = SearchProvider(service);
    super.initState();
  }

  @override
  void dispose() {
    _searchProvider.dispose();
    _inputDebouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                hintText: 'Search instrument',
              ),
              onChanged: (input) {
                _inputDebouncer.run(() {
                  _searchProvider.queryKeyword(input);
                });
              },
            ),
            color: theme.cardColor,
          ),
          Expanded(
            child: ChangeNotifierProvider<SearchProvider>.value(
              value: _searchProvider,
              child: const _SearchInstrumentResultList(),
            ),
          )
        ],
      ),
    );
  }
}

class _SearchInstrumentListItem extends StatelessWidget {
  final SearchResult item;

  const _SearchInstrumentListItem({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Row(
          children: [
            InstrumentIcon(
              name: item.name,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.symbol,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.name,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Selector<UserSettingService, bool>(
              builder: (context, isFollowing, child) {
                return ElevatedButton(
                  onPressed: () {
                    final userSettingUserService = context.read<UserSettingService>();
                    if (isFollowing) {
                      userSettingUserService.unwatchInstrument(item.name);
                    } else {
                      userSettingUserService.watchInstrument(item.name);
                    }
                  },
                  child: Text(isFollowing ? 'Unfollow' : 'Follow'),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                );
              },
              selector: (_, userSettingService) =>
                  userSettingService.watchingInstrument.contains(item.name) ??
                  false,
            )
          ],
        ),
      ),
    );
  }
}

class _SearchInstrumentResultList extends StatelessWidget {
  const _SearchInstrumentResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return ListView(
      children: provider.searchResult
          .map((item) => _SearchInstrumentListItem(
                item: item,
                key: ObjectKey(item.symbol),
              ))
          .toList(),
    );
  }
}
