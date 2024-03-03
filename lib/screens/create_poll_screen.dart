import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePollHome extends StatelessWidget {
  const CreatePollHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // replace this with your list of polls length
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Poll \$index'), // replace this with your poll data
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action to create a new poll here
        },
        child: Icon(Icons.add),
        tooltip: 'Create New Poll',
      ),
    );
  }
}
