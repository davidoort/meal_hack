import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/constants/routing_constants.dart';
import 'package:meal_hack_flutter/screens/home_page.dart';
import 'package:meal_hack_flutter/helpers/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Hack',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      // home: HomePage(),
      onGenerateRoute: router.generateRoute,
      initialRoute: DiaryPageRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
