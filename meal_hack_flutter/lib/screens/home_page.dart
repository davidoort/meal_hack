import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/helpers/cupertino_home_scaffold.dart';
import 'package:meal_hack_flutter/helpers/tab_item.dart';
import 'package:meal_hack_flutter/screens/groceries_page.dart';
import 'package:meal_hack_flutter/screens/diary_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.diary;

  void _select(TabItem tabItem) {
    if (_currentTab == tabItem) {
      // pop to first route (seems to only work on iOS)
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Map<TabItem, WidgetBuilder> get widgetBuilder => {
        TabItem.diary: (_) => DiaryPage(),
        // TabItem.recommendations: (_) => EntriesPage.create(context),
        TabItem.groceries: (_) => GroceriesPage(),
      };

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.diary: GlobalKey<NavigatorState>(),
    // TabItem.recommendations: GlobalKey<NavigatorState>(),
    TabItem.groceries: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilder: widgetBuilder,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
