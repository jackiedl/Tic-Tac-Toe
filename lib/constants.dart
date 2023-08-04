import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData(
  colorSchemeSeed: const Color(0XFFF2EBD4), 
  scaffoldBackgroundColor: const Color(0XFFF2EBD4), 
  fontFamily: "PlayfairDisplay",
  useMaterial3: true,

  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 247, 203, 108), 
  ),
);

const kPlayerXactiveColor = Color(0xFFec2213);
const kPlayerXinactiveColor = Color(0xFFff8064);
const kPlayerOactiveColor = Color(0xFF13deec);
const kPlayerOinactiveColor = Color(0xFFaef1f6);

const kHeaderTextStyle = TextStyle(
  fontSize: 38.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFff8064)),
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);