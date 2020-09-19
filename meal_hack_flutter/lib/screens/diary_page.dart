import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        title: Text('Jessica\'s Meal Diary'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.settings), onPressed: () => {}),
      ),
      // body: _buildContent(context, database),
    );
  }
}
