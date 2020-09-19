import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/meal_page.dart';
import 'package:meal_hack_flutter/screens/ingredient_page.dart';
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
  bool vegetarian = false;
  bool vegan = false;
  bool dairyFree = false;
  bool nutFree = false;

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
          onChanged: (bool value) { toast("Still to be done"); },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
              checkbox("Vegetarian", vegetarian),
              checkbox("Vegan", vegan),
              checkbox("Dairy free", dairyFree),
              checkbox("Nut free", nutFree),
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
