import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/meal_page.dart';
import 'package:meal_hack_flutter/screens/ingredient_page.dart';
import 'package:meal_hack_flutter/models/user_settings.dart';
import 'package:overlay_support/overlay_support.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future navigateToMealPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage()));
  }
  Future navigateToIngredientPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => IngredientPage()));
  }

  TextEditingController _textController = TextEditingController();

  // Where to search
  bool meals = true;

  
  // Search filters
  bool vegetarian;
  bool vegan = UserSettings.restrictions.contains(Restriction.vegan);
  bool nutAllergy = UserSettings.restrictions.contains(Restriction.nutAllergy);
  bool glutenFree = UserSettings.restrictions.contains(Restriction.glutenFree);
  bool dairyFree = UserSettings.restrictions.contains(Restriction.dairyFree);

  static List<String> mainDataList = [
   "Apple",
   "Apricot",
   "Banana",
   "Blackberry",
   "Coconut",
   "Date",
   "Fig",
   "Gooseberry",
   "Grapes",
   "Lemon",
   "Litchi",
   "Mango",
   "Orange",
   "Papaya",
   "Peach",
   "Pineapple",
   "Pomegranate",
   "Starfruit"
  ];


  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "vegetarian":
                  this.vegetarian = value;
                  break;
                case "vegan":
                  this.vegan = value;
                  break;
                case "nut allergy":
                  this.nutAllergy = value;
                  break;
                case "gluten free":
                  this.glutenFree = value;
                  break;
                case "dairy free":
                  this.dairyFree = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    this.vegetarian = this.vegetarian == null ? UserSettings.restrictions.contains(Restriction.vegetarian) : this.vegetarian;
    this.vegan = this.vegan == null ? UserSettings.restrictions.contains(Restriction.vegan) : this.vegan;
    this.nutAllergy = this.nutAllergy == null ? UserSettings.restrictions.contains(Restriction.nutAllergy) : this.nutAllergy;
    this.glutenFree = this.glutenFree == null ? UserSettings.restrictions.contains(Restriction.glutenFree) : this.glutenFree;
    this.dairyFree = this.dairyFree == null ? UserSettings.restrictions.contains(Restriction.dairyFree) : this.dairyFree;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Search by ingredients"),
              Switch(
                value: meals,
                onChanged: (value){
                  setState(() {
                    meals=value;
                    toast("Hell yeah, search them " + (meals ? "meals" : "ingredients") + "!");
                  });
                }
              ),
              Text("Search by meals"),
            ],
          ),          



          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("vegetarian", this.vegetarian),
              checkbox("vegan", this.vegan),
              checkbox("nut allergy", this.nutAllergy),
              checkbox("gluten free", this.glutenFree),
              checkbox("dairy free", this.dairyFree),
            ],
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(data),
                  onTap: () {
                    meals ? navigateToMealPage(context) : navigateToIngredientPage(context);
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
