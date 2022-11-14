import 'package:flutter/material.dart';
import '../portfolio/portfolio.dart';
import '../dashboard/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _TabContent {
  final String tabName;
  final Widget child;
  final Widget icon;

  const _TabContent({required this.tabName, required this.child, required this.icon});
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const List<_TabContent> homeTab = [
    _TabContent(tabName: 'Dashboard', child: Dashboard(), icon: Icon(Icons.home)),
    _TabContent(tabName: 'Portfolio', child: Portfolio(), icon: Icon(Icons.person))
  ];

  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: homeTab.map((tab) => tab.child).toList(growable: false),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: homeTab
            .map((tab) => BottomNavigationBarItem(
                  icon: tab.icon,
                  label: tab.tabName,
                ))
            .toList(growable: false),
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}