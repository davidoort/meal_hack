import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class GroceriesPage extends StatefulWidget {
  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceriesPage> {
  List<String> groceriesItems = ["apples", "oranges"];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Groceries list"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                toast("Let's go to the search view, whaddya say ?");
              },
              child: Icon(
                Icons.add,
                size: 26.0,
              ),
            )
          ),
        ],
      ),


      body: ListView.builder(
        itemCount: groceriesItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${groceriesItems[index]}'),
            onTap: () {
              toast("I can haz transishion pweeeaze ?");
            },
           );
         },
      ),
      
    );
  }
}
