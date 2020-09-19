import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/constants/routing_constants.dart';
import 'package:meal_hack_flutter/helpers/fab_with_icons.dart';
import 'package:meal_hack_flutter/helpers/fab_bottom_app_bar.dart';
import 'package:meal_hack_flutter/helpers/layout.dart';
import 'package:meal_hack_flutter/helpers/router.dart';
import 'package:meal_hack_flutter/helpers/tab_item.dart';

class NavBarScaffold extends StatelessWidget {
  const NavBarScaffold({
    Key key,
    @required this.currentTab,
  })
  // @required this.onSelectTab,
  // @required this.widgetBuilder,
  // @required this.navigatorKeys})
  : super(key: key);

  final TabItem currentTab;
  // final ValueChanged<TabItem> onSelectTab;
  // final Map<TabItem, WidgetBuilder> widgetBuilder;
  // final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TabItemData.allTabs[currentTab].title),
      ),
      // PageBody
      body: Center(
        child: Text(
          TabItemData.allTabs[currentTab].title,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        // centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (_) => {
          Navigator.replace(context,
              oldRoute: generateRoute(RouteSettings(name: DiaryPageRoute)),
              newRoute: generateRoute(RouteSettings(name: GroceriesPageRoute)))
          // Navigator.pushReplacementNamed(context, GroceriesPageRoute)
          // Navigator.pushNamed(context, GroceriesPageRoute)
          // Navigator.of(context).popAndPushNamed(GroceriesPageRoute)
          // Navigator.replaceRouteBelow(context,
          // anchorRoute: generateRoute(RouteSettings(name: DiaryPageRoute)))
          // Navigator.pop(context)
          // currentTab = TabItem.values[index]
        },
        items: [
          for (TabItem item in TabItem.values)
            FABBottomAppBarItem(
                iconData: TabItemData.allTabs[item].icon,
                text: TabItemData.allTabs[item].title)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.call, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            // onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  // CupertinoTabScaffold(
  //   tabBar: CupertinoTabBar(
  //     items: [for (TabItem item in TabItem.values) _buildItem(item)],
  //     onTap: (index) => onSelectTab(TabItem.values[index]),
  //   ),
  //   tabBuilder: (context, index) {
  //     final item = TabItem.values[index];
  //     return CupertinoTabView(
  //       navigatorKey: navigatorKeys[item],
  //       builder: widgetBuilder[item],
  //     );
  //   },
  // );

  // BottomNavigationBarItem _buildItem(TabItem item) {
  //   final itemData = TabItemData.allTabs[item];
  //   final color = currentTab == item ? Colors.orange : Colors.grey;
  //   return BottomNavigationBarItem(
  //     icon: Icon(
  //       itemData.icon,
  //       color: color,
  //     ),
  //     title: Text(
  //       itemData.title,
  //       style: TextStyle(
  //         color: color,
  //       ),
  //     ),
  //   );
  // }
}
