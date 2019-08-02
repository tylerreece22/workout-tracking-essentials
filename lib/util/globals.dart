library my_prj.globals;

import 'dart:convert';

import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

import 'AppFileWriter.dart';

AppFileWriter writer = new AppFileWriter();
User user;

getUser() async {
  String userString = await writer.readUser();
  Map<String, dynamic> jsonMap = await json.decode(userString);
  user = User.fromJson(jsonMap);
  return user;
}

getRoutine(String routineId) async {
  user = await getUser();
  Routine routine =
      user.routines.where((routine) => routine.id == routineId).toList()[0];
  return routine;
}
