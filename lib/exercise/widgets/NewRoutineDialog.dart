import 'package:flutter/material.dart';

class NewRoutineDialog extends StatefulWidget {
  String fieldName;
  
  @override
  State<StatefulWidget> createState() => NewRoutineDialogState(this.fieldName); 
}

class NewRoutineDialogState extends State<NewRoutineDialog> {
  final fieldNameController = TextEditingController();
  String fieldName;
  FocusNode _focusNode = FocusNode();

  NewRoutineDialogState(this.fieldName);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fieldNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fieldNameController.text = fieldName;
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        fieldNameController.selection = TextSelection(baseOffset: 0, extentOffset: fieldNameController.text.length);
      }
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('New Routine Name:'),
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
                setState(() {
                  fieldName = fieldNameController.text.trim();
                });
                fieldNameController.text = fieldName;
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
                  fieldNameController.text = fieldName;
                }
            ),
          ],
        )
      ],
    );;
  }
  
}