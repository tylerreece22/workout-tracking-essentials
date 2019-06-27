import 'package:flutter/material.dart';

class WorkoutRow extends StatelessWidget {
  String item1;
  String item2;
  String item3;
  String item4;
  String item5;

  WorkoutRow(this.item1, this.item2, this.item3, this.item4, this.item5);

  Widget _rowItem(String headerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(headerName),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30.0,
        child: GridView.count(
          crossAxisSpacing: 15.0,
          physics: NeverScrollableScrollPhysics(),
          // Diables GridView scrolling
          shrinkWrap: true,
          //
          primary: true,
          crossAxisCount: 5,
          children: <Widget>[
            _rowItem(item1),
            _rowItem(item2),
            _rowItem(item3),
            _rowItem(item4),
            _rowItem(item5),
          ],
        ));
  }

}