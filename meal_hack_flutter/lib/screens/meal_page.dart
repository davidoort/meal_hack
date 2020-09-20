import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/ingredient_page.dart';
import 'package:meal_hack_flutter/models/meal.dart';
import 'package:meal_hack_flutter/models/recipe.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart';

Future<Recipe> fetchRecipeWithId(int Id) async {
  final response = await http.get('http://7e6d8618d47a.ngrok.io/recipes/' + Id.toString()); 

  print("wassup");
  if (response.statusCode == 200) {
    print("a-okay");
    Iterable list = json.decode(response.body);
    print(list.toString());
    Recipe r = Recipe.fromJson(json.decode(response.body));
    print(r);
    print("hello");
    return r;
  } else {
    throw Exception('Failed to load meals');
  }
}

class MealPage extends StatefulWidget {
  @override
  final Meal meal;
  MealPage({Key key, @required this.meal}) : super(key: key);

  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  Future navigateToIngredientPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => IngredientPage()));
  }

  _MealPageState({Key key, @required this.recipeId}) : super();

  int recipeId;
  Future<Recipe> futureRecipe;

  @override
  Widget build(BuildContext context) {
    recipeId = widget.meal.recipeId;
    futureRecipe = fetchRecipeWithId(recipeId);

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Recipe>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Recipe recipe = snapshot.data;
                      return Text(
                        'Nutriscore ' + recipe.nutrients.calories.toString() + " cal.",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      );
                    } else if (snapshot.hasError) return Text("${snapshot.error}");

                    return CircularProgressIndicator();
                  }
                ),

                FutureBuilder<Recipe>(
                  future: futureRecipe,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Recipe recipe = snapshot.data;
                      return Text(
                        'Carbon footprint ' + recipe.nutrients.calories.toString() + " g. of CO2", // TODO:
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      );
                    } else if (snapshot.hasError) return Text("${snapshot.error}");

                    return CircularProgressIndicator();
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget labelSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // TODO: add if statements to add the icons
          _buildButtonColumn(color, Icons.call, 'Vegetarian'),
          _buildButtonColumn(color, Icons.near_me, 'Dairy-free'),
          _buildButtonColumn(color, Icons.share, 'Contains nuts'),
        ],
      ),
    );

    Widget ingredientsSection = Container(
      //padding: const EdgeInsets.all(32),
      height: 100.0,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Text('Ingredients'),
          ListTile(
            title: Text('Ingredient 1'), // TODO:
            onTap: () {
                navigateToIngredientPage(context);
            },
          ),
          ListTile(
            title: Text('Ingredient 2'),
            onTap: () {
                navigateToIngredientPage(context);
            },
          ),
        ],
      ),
    );

    Widget preparationSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
'Cut the onions. Throw them in a pan with the chocolate. Add some meat sauce. Throw in poisonous mushrooms. Stuff the turkey with the preparation. Put the turkey in the cake, and bake at 180 for 1h.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Recipe>(
          future: futureRecipe,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Recipe recipe = snapshot.data;
              return Text(
                  '${recipe.title[0]}' // TODO: Why tf does this show "type..." ?
                );
            } else if (snapshot.hasError) return Text("${snapshot.error}");

            print("fuck");
            return CircularProgressIndicator();
            }           
          ),
      ),
       body: ListView(
         children: [
           Image.asset(
            'images/meal1.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
           labelSection,
           ingredientsSection,
           preparationSection,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}