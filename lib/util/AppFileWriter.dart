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

  Future<File> get _localHistoryFile async {
    final path = await _localPath;
    return File('$path/routineHistory.json');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      print('reading contents of file: ' + contents);
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

  Future<Routine> writeRoutine(Routine routine, {isHistory}) async {
    File file;
    user.routines.add(routine);
    if (isHistory != null) {
      file = await _localHistoryFile;
    } else {
      file = await _localFile;
    }
    final userString = jsonEncode(user);
    print('writing to file: ' + userString);

    // Write the file.
    await file.writeAsString(userString);
    return routine;
  }

  deleteRoutine(String uuid) async {
    user.routines =
        user.routines.where((routine) => routine.id != uuid).toList();
    final file = await _localFile;
    final userString = jsonEncode(user);
    print('deleted and writing to file: ' + userString);

    // Write the file.
    await file.writeAsString(userString);
  }

  Future<Routine> updateRoutine(Routine routine) async {
    await deleteRoutine(routine.id);
    await writeRoutine(routine);
    return routine;
  }
}
