import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/constants/routing_constants.dart';
import 'package:meal_hack_flutter/screens/navbar_scaffold_page.dart';
import 'package:meal_hack_flutter/helpers/tab_item.dart';
import 'package:meal_hack_flutter/screens/diary_page.dart';
import 'package:meal_hack_flutter/screens/groceries_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DiaryPageRoute:
      return MaterialPageRoute(
          builder: (context) => NavBarScaffold(
                currentTab: TabItem.diary,
              ));
    case GroceriesPageRoute:
      return MaterialPageRoute(
          builder: (context) => NavBarScaffold(
                currentTab: TabItem.groceries,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => NavBarScaffold(
                currentTab: TabItem.diary,
              ));
  }
}
