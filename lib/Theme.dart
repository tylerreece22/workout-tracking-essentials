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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
      ));
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),
        title: base.title.copyWith(
          fontSize: 30.0,
          fontWeight: FontWeight.w800,
        ),
        body1: base.body1.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.w500
        ),
        subtitle: base.subtitle.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
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
      );
}
