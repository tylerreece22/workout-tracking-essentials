import 'package:flutter/material.dart';

class WorkoutRow extends StatelessWidget {
  Widget item1;
  Widget item2;
  Widget item3;
  Widget item4;
  Widget item5;

  WorkoutRow(this.item1, this.item2, this.item3, this.item4, this.item5);

  Widget _rowItem(Widget headerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        headerName,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 15.0,
      physics: NeverScrollableScrollPhysics(),
      // Diables GridView scrolling
      shrinkWrap: true,
      //
      childAspectRatio: 2.0,
      primary: true,
      crossAxisCount: 5,
      children: <Widget>[
        _rowItem(item1),
        _rowItem(item2),
        _rowItem(item3),
        _rowItem(item4),
        _rowItem(item5),
      ],
    );
  }
}
