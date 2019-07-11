import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  Function(String) setField;
  String fieldName;
  String title;
  Function() setXPressed;

  AppDialog(this.setField, this.fieldName, {this.setXPressed, this.title});

  @override
  State<StatefulWidget> createState() => AppDialogState();
}

class AppDialogState extends State<AppDialog> {
  final fieldNameController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  AppDialogState();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fieldNameController.text = widget.fieldName;
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        fieldNameController.selection = TextSelection(
            baseOffset: 0, extentOffset: fieldNameController.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: widget.title != null ? Text(widget.title) : Text('New Name:'),
      content: TextField(
        autofocus: true,
        controller: fieldNameController,
        focusNode: _focusNode,
      ),
      actions: <Widget>[
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                  widget.setField(fieldNameController.text.trim());
                fieldNameController.text = widget.fieldName;
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
                  widget.setXPressed();
                  fieldNameController.text = widget.fieldName;
                }),
          ],
        )
      ],
    );
  }
}
