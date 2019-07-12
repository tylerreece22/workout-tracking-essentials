import 'package:flutter/material.dart';

class BinaryAppDialog extends StatefulWidget {
  String title;
  Function() setYes;

  BinaryAppDialog(this.title, this.setYes);

  @override
  State<StatefulWidget> createState() => BinaryAppDialogState();
}

class BinaryAppDialogState extends State<BinaryAppDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: widget.title != null ? Text(widget.title) : Text('Yay or Nay:'),
      actions: <Widget>[
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                widget.setYes();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        )
      ],
    );
  }
}
