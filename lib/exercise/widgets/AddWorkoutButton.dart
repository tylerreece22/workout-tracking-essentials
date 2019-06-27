import 'package:flutter/material.dart';

class AddWorkoutButton extends StatelessWidget {
  Function() addWorkout;

  AddWorkoutButton({Function() this.addWorkout});

  @override
  Widget build(BuildContext context) {
    return
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () => addWorkout(),
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        'Exercise',
                        style: Theme
                            .of(context)
                            .textTheme
                            .button,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

}