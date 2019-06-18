import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/MyCard.dart';

class WorkoutHome extends StatelessWidget {
  WorkoutHome({this.style}) : super();
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text('Workout', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0),child: Text('Quick Start', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RaisedButton(
                    onPressed: () => {},
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).textSelectionColor,
                    child: Text('Start Workout'),
                  ),
                ),
                Text('Routines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              MyCard(
                title: Text('Monday'),
                icon: Icon(Icons.calendar_today),
              ),
              MyCard(
                title: Text('Monday'),
                icon: Icon(Icons.calendar_today),
              ),
              MyCard(
                title: Text('Monday'),
                icon: Icon(Icons.calendar_today),
              ),
              MyCard(
                title: Text('Monday'),
                icon: Icon(Icons.calendar_today),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0),child: Text('Example Routines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
