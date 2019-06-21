import 'package:flutter/material.dart';

final ThemeData appTheme = buildTheme();

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: Colors.amber,
      primaryColor: Colors.blueGrey,
      buttonColor: Colors.amber,
      cardColor: Colors.white70,
      textSelectionColor: Colors.black,
      errorColor: Colors.red,
      textTheme: _buildAppTextTheme(base.textTheme),
      primaryTextTheme: _buildAppTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildAppTextTheme(base.accentTextTheme),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        buttonColor: Colors.amber,
      ));
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w900,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        caption: base.caption.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        button: base.button.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      )
      .apply(
        fontFamily: 'Cantarell',
        displayColor: Colors.black,
        bodyColor: Colors.black,
      );
}

ButtonThemeData _buildAppButtonTheme(ButtonThemeData base) {
  return base.copyWith(
    buttonColor: Colors.green,
    highlightColor: Colors.greenAccent,
    disabledColor: Colors.grey,
  );
}
