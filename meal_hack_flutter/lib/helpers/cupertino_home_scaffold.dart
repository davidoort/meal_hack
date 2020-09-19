import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold(
      {Key key,
      @required this.currentTab,
      @required this.onSelectTab,
      @required this.widgetBuilder,
      @required this.navigatorKeys})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilder;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [for (TabItem item in TabItem.values) _buildItem(item)],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[item],
          builder: widgetBuilder[item],
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    final itemData = TabItemData.allTabs[item];
    final color = currentTab == item ? Colors.orange : Colors.grey;
    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
        color: color,
      ),
      title: Text(
        itemData.title,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
