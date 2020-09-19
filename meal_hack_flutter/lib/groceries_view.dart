import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> groceriesItems = ["apples", "oranges"];

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Groceries list';

    return OverlaySupport(
      child: MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
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
            backgroundColor: Colors.blue,
            onPressed: () {
              toast("Let's go to the search view, whaddya say ?");
            },
          ),
              

        ),
      )
    );
  }
}