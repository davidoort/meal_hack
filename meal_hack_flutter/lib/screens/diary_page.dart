import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/meal_page.dart';
import 'package:overlay_support/overlay_support.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  Future navigateToMealPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage()));
  }

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
            ListTile(
              title: Text('Meal 1'),
              onTap: () {
                navigateToMealPage(context);
              },
            ),
            ListTile(
              title: Text('Meal 2'),
              onTap: () {
                navigateToMealPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
