import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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


    return OverlaySupport(
      child: MaterialApp(
        title: 'Ingredient view',
        home: Scaffold(
          appBar: AppBar(
            title: Text('<Insert ingredient name here>'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/ingredient1.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              labelSection,
            ],
          ),
        ),
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