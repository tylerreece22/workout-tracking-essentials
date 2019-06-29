import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ButtonTheme(
            height: 10.0,
            minWidth: 5.0,
            padding: EdgeInsets.all(5.0),
            buttonColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0)
            ),
            child: RaisedButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () => print('pressed'),
              child: Icon(Icons.check, color: Colors.white,),
            )),
      ],
    );
  }
}
