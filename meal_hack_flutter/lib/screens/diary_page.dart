import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/meal_page.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import '../models/meal.dart';
import 'dart:convert';
import 'dart:core';

Future<List<Meal>> fetchMeals() async {
  final response = await http.get('http://ad4decd8249e.ngrok.io/meals/');

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return List<Meal>.from(list.map((e) => Meal.fromJson(e)));
  } else {
    throw Exception('Failed to load meals');
  }
}

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  Future<List<Meal>> futureMeals;

  Future navigateToMealPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MealPage()));
  }

  @override
  void initState() {
    super.initState();
    futureMeals = fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary"),
      ),
      body: Center(
          child: FutureBuilder<List<Meal>>(
              future: futureMeals,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Meal> meals = snapshot.data;
                  return new Text(meals[0].quantity.toString());
                } else if (snapshot.hasError) return Text("${snapshot.error}");

                return CircularProgressIndicator();
              })
          /*
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
        ),*/
          ),
    );
  }
}
