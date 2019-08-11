import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/util/UserManager.dart';

class UserProvider extends InheritedWidget {
  final UserManager data;

  UserProvider({Key key, Widget child, this.data})
      : super(key: key, child: child);

  static UserManager of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
        .data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
