import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/meal_page.dart';
import 'package:meal_hack_flutter/models/user_settings.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import '../models/meal.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart';

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

  Widget checkbox(String title, Restriction restr) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: UserSettings.restrictions.contains(restr),
          onChanged: (bool value) { 
            setState(() {
              UserSettings.restrictions.contains(restr) ? UserSettings.restrictions.remove(restr) : UserSettings.restrictions.add(restr);
            });
          }
        ),
        Text(title)
      ],
    );
  }

  List<String> restrictions = List<String>.generate(Restriction.values.length, (i) => Restriction.values[i].toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diary"),
      ),
      drawer: Drawer(  
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          children: <Widget>[  
            DrawerHeader(
              child: Text('Settings'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),  
            Column(  
              children: <Widget>[
                checkbox("vegetarian", Restriction.vegetarian),
                checkbox("vegan", Restriction.vegan),
                checkbox("nut allergy", Restriction.nutAllergy),
                checkbox("gluten free", Restriction.glutenFree),
                checkbox("dairy free", Restriction.dairyFree),
              ], 
            ),  


            ListTile(  
              leading: Icon(Icons.attach_money), title: Text("Budget per meal: " + UserSettings.budget.toString() + " CHF"),  
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Please enter a new budget (in CHF)"),
                      content: TextFormField (
                        decoration: new InputDecoration(labelText: "Enter your number"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                        ],
                        onSaved: (input) => {
                          print(input),
                          UserSettings.budget = num.tryParse(input)
                          },
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("OK"),
                          onPressed: () {
                            // TODO: Update budget
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.access_time), title: Text("Preparation time: " + (UserSettings.prepTime / 60).toString() + " hours " + (UserSettings.prepTime % 60).toString() + " minutes"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
          ],  
        ),  
      ),  
      
      body: Center(
          child: FutureBuilder<List<Meal>>(
              future: futureMeals,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Meal> meals = snapshot.data;
                  return ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('${meals[index].recipeName}'),
                            onTap: () {
                              navigateToMealPage(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
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
