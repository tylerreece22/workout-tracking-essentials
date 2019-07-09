import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckButtonState();
}

class CheckButtonState extends State<CheckButton> {
  Color checkColor = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ButtonTheme(
            minWidth: 5.0,
            padding: EdgeInsets.all(5.0),
            buttonColor: checkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)
            ),
            child: RaisedButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                setState(() {
                  checkColor = checkColor == Colors.white30 ? Colors.green : Colors.white30;
                });
              },
              child: Icon(Icons.check, color: Colors.white,),
            )),
      ],
    );
  }
}
