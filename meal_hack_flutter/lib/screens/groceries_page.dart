import 'package:flutter/material.dart';

class GroceriesPage extends StatelessWidget {
  // const GroceriesPage(
  //     {Key key,
  //     @required this.currentTab,
  //     @required this.onSelectTab,
  //     @required this.widgetBuilder,
  //     @required this.navigatorKeys})
  //     : super(key: key);

  // final TabItem currentTab;
  // final ValueChanged<TabItem> onSelectTab;
  // final Map<TabItem, WidgetBuilder> widgetBuilder;
  // final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Groceries'),
        centerTitle: true,
        actions: [
          IconButton(
            key: Key('addJobIconButton'),
            icon: Icon(Icons.add),
            // onPressed: () => EditJobPage.show(context, database: database),
          ),
        ],
      ),
      // body: _buildContent(context, database),
      // bottomNavigationBar: ,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _buildFab(
      //     context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
