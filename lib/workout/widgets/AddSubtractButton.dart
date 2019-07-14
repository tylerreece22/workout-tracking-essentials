import 'package:flutter/material.dart';

class AddSubtractButton extends StatelessWidget {
  Function() callback;
  bool add;
  String text;
  bool isMax;

  AddSubtractButton(this.add, this.text, this.callback, {this.isMax});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: isMax != null ? MainAxisSize.max : MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: add ? Colors.green : Colors.red,
            onPressed: callback,
            child: Row(
              children: <Widget>[
                Icon(
                  add ? Icons.add : Icons.remove,
                  color: Colors.white,
                ),
                Text(
                  text,
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