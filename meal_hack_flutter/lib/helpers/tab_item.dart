import 'package:flutter/material.dart';

enum TabItem { diary, search, groceries }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.diary: TabItemData(title: 'Diary', icon: Icons.calendar_today),
    TabItem.search: TabItemData(title: 'Search', icon: Icons.search),
    TabItem.groceries:
        TabItemData(title: 'Groceries', icon: Icons.shopping_basket),
  };
}
