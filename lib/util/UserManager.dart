import 'dart:async';

import 'package:workout_tracking_essentials/model/User.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as global;

class UserManager {
  Stream<User> get user => Stream.fromFuture(global.getUser());
}
