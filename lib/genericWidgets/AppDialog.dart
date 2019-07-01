import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  String fieldName;

  AppDialog(this.fieldName);

  @override
  State<StatefulWidget> createState() => AppDialogState(fieldName);
}

class AppDialogState extends State<AppDialog> {
  final fieldNameController = TextEditingController();
  String fieldName;
  FocusNode _focusNode = FocusNode();

  AppDialogState(this.fieldName);

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
    return FlatButton(
        child: Text(
          fieldName.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  title: Text('New Name:'),
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
                );
              });
        });
  }
}
