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

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          toast("Let's go to the search view, whaddya say ?");
        },
      ),
      
    );
  }
}
