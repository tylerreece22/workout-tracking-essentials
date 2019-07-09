import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_tracking_essentials/workout/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class MyRoutines extends StatelessWidget {
  User user;

  Future<List<Routine>> _getMyRoutines(context) async {
    String userString = await readUser();
    print(user);
    Map<String, dynamic> jsonMap = await json.decode(userString);
    user = User.fromJson(jsonMap);

    return user.routines;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/myRoutines.json');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print('contents of local file: ' + contents);
      Map<String, dynamic> jsonMap = await json.decode(contents);
      // Set state
      user = User.fromJson(jsonMap);
      return contents;
    } catch (e) {
      return '${e}';
    }
  }

  //TODO: Figure this shit out...
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMyRoutines(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverGrid(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              ...snapshot.data
                        .map<Widget>((routine) => RoutineCard(routine))
                        .toList(),
            ]),
          );
        } else if (snapshot.hasError) {
          return SliverList(
            delegate: SliverChildListDelegate([
              Text("${snapshot.error}"),
            ]),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([
            CircularProgressIndicator(),
          ]),
        );
      },
    );
  }
}
