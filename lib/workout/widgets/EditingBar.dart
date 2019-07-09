import 'package:flutter/material.dart';

class EditingBar extends StatelessWidget {
  String editName;
  Function() checkFunction;

  EditingBar(this.editName, this.checkFunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Decide to have a border or not. Maybe change opacity?
//      decoration: BoxDecoration(
//          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60.0,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: RaisedButton(
                  color: Colors.red,
                  child: Icon(Icons.clear,
                      color: Theme.of(context).iconTheme.color),
                  onPressed: () => Navigator.pop(context)),
            ),
          ),
          Text(editName, style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.grey)),
          Container(
              width: 60.0,
              child: Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: RaisedButton(
                    onPressed: () => checkFunction(),
                    color: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Theme.of(context).iconTheme.color,
                    )),
              )),
        ],
      ),
    );
  }
}
