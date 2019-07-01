import 'package:flutter/material.dart';

class SetField extends StatefulWidget {
  String fieldName;

  SetField(this.fieldName);

  @override
  State<StatefulWidget> createState() => SetFieldState(fieldName);
}

class SetFieldState extends State<SetField> {
  final _fieldNameController = TextEditingController();
  String fieldName;
  final _focusNode = FocusNode();

  SetFieldState(this.fieldName);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _fieldNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fieldNameController.text = fieldName;
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        _fieldNameController.selection = TextSelection(baseOffset: 0, extentOffset: _fieldNameController.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Flexible(
            child: Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextFormField(
        cursorWidth: 5.0,
        autofocus: false,
        style: Theme.of(context).textTheme.body2,
        textAlign: TextAlign.center,
        controller: _fieldNameController,
        focusNode: _focusNode,
      ),
    )));
  }
}
