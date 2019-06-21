import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'exercise/ExerciseHome.dart';
import 'workout/WorkoutHome.dart';
import 'Colors.dart';

void main() {
//  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData myAppTheme = buildTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout',
      theme: myAppTheme,
      home: MyHomePage(title: 'Workout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Profile',
      style: optionStyle,
    ),
    WorkoutHome(style: optionStyle),
    ExerciseHome(style: optionStyle),
    Text(
      'History',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final ThemeData myAppTheme = buildTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.only(top: 33.0),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text('Workout'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            title: Text('Exercises'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
