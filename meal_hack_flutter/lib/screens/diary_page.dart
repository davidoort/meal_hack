import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/models/user_settings.dart';

class DiaryPage extends StatelessWidget {
  DiaryPage({
    Key key,
    @required this.settings,
    @required this.updateSettings,
  }) : super(key: key);

  final void Function(UserSettings) updateSettings;
  UserSettings settings;

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context, listen: false);
    print(settings.vegetarian);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        title: Text('Jessica\'s Meal Diary'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Checkbox(
                onChanged: (value) => {
                  if (value != null)
                    updateSettings(UserSettings(vegetarian: value))
                },
                tristate: true,
                value: settings.vegetarian,
                activeColor: Colors.orange[100],
              ),
              title: Text('Vegetarian'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      // body: _buildContent(context, database),
    );
  }
}
