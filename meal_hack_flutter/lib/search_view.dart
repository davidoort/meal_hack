import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Meal/ingredient search')
            ),
            body: Center(
              child: ListSearch()
            )
        )
      )
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

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

          /*
          Switch(
            value: meals,
            onChanged: (value){
              setState(() {
                meals=value;
                toast("Hell yeah, search them " + (meals ? "meals" : "ingredients") + "!");
              });
            }
          ),
          */

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
                  onTap: ()=> print(data),);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}