import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/MyCard.dart';

class ExerciseHome extends StatelessWidget {
  ExerciseHome({this.style}) : super();
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
          new MyCard(
              // Setup the text
              title: new Text(
                "Favorite",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Setup the icon
              icon: new Icon(Icons.favorite, size: 10, color: Colors.red)),
        ],
      ),
    );
  }
}
