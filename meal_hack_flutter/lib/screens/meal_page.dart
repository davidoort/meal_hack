import 'package:flutter/material.dart';
import 'package:meal_hack_flutter/screens/ingredient_page.dart';
import 'package:overlay_support/overlay_support.dart';

class MealPage extends StatelessWidget {
  Future navigateToIngredientPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => IngredientPage()));
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nutriscore',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Carbon footprint',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
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
          DrawerHeader(
            child: Text('Ingredients (this is scrollable btw)'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Ingredient 1'),
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
        title: Text('<Insert meal title here>'),
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