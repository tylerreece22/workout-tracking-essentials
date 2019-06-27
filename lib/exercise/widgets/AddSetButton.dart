import 'package:flutter/material.dart';

class AddSetButton extends StatelessWidget {
  Function() addSet;

  AddSetButton(this.addSet);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Colors.lightGreen,
            onPressed: addSet,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Set',
                  style: Theme.of(context).textTheme.button,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}