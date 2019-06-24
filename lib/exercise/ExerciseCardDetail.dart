import 'package:flutter/material.dart';

class ExerciseCardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Detail', style: Theme.of(context).primaryTextTheme.headline,),
      ),
      body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            )
          ],
        ),
    );
  }
}
