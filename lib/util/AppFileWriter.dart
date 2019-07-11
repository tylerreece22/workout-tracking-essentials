import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class AppFileWriter {
  User user;
  String fileName = 'myRoutines.txt';

  static final AppFileWriter _singleton = new AppFileWriter._internal();

  factory AppFileWriter() {
    return _singleton;
  }

  AppFileWriter._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      print('contents of local file: ' + contents);
      Map<String, dynamic> jsonMap = await jsonDecode(contents);
      // Set state
      user = User.fromJson(jsonMap);
      return contents;
    } catch (e) {
      print(e);
      user = new User(<Routine>[]);
      await _writeNewUser();
      return json.encode(user.toJson());
    }
  }

  _writeNewUser() async {
    final file = await _localFile;
    print('Writing new user!');
    final userString = jsonEncode(user);
    file.writeAsString(userString);
  }

  Future<File> writeRoutine(Routine routine) async {
//    String userFromLocal = await readUser();
//    Map<String, dynamic> jsonMap = await jsonDecode(userFromLocal);
    // Set state
//    user = User.fromJson(jsonMap);
    user.routines.add(routine);
    final file = await _localFile;
    print('Writing workouts locally!');
    print(jsonEncode(user));
//    final userString = _convertWorkoutsToString();
//    final userString = "{routines: [{name: 'stupid routine', workouts: [{name: 'dick ups', sets: [{setNumber: 1, previous: '100x5', weight: 100, reps: 5}]}]}]}";
    final userString = jsonEncode(user);
    print('writing to file: ' + userString);

    // Write the file.
    return file.writeAsString(userString);
  }
}
