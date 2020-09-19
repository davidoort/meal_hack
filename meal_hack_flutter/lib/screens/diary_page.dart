import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary"),
      ),
      body: Center(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            /*
            DrawerHeader(
              child: Text('Meal plan'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            */
            ListTile(
              title: Text('Meal 1'),
              onTap: () {
                // Move to the meal viewing screen
                toast("I can haz transishion pweeeaze ?");
              },
            ),
            ListTile(
              title: Text('Meal 2'),
              onTap: () {
                toast("I can haz transishion pweeeaze ?");
              },
            ),
          ],
        ),
      ),
    );
  }
}
