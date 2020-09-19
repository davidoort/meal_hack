import 'package:flutter/material.dart';

// enum TabItem { diary, recommendations, groceries }
enum TabItem { diary, groceries }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.diary: TabItemData(title: 'Diary', icon: Icons.view_headline),
    // TabItem.recommendations:
    // TabItemData(title: 'Recommended', icon: Icons.lightbulb_outline),
    TabItem.groceries:
        TabItemData(title: 'Groceries', icon: Icons.shopping_basket),
  };
}
