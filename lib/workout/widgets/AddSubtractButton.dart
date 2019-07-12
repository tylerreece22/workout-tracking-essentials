import 'package:flutter/material.dart';

class AddSubtractButton extends StatelessWidget {
  Function() callback;
  bool add;

  AddSubtractButton(this.add, this.callback);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: add ? Colors.lightGreen : Colors.red,
            onPressed: callback,
            child: Row(
              children: <Widget>[
                Icon(
                  add ? Icons.add : Icons.remove,
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