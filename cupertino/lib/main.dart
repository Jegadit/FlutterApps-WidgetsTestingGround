import 'package:cupertino/log_in.dart';
//import 'package:cupertino/verify_number.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
      ),
      //theme: CupertinoThemeData(brightness: Brightness.light, primaryColor: Color(0xFF08C187)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

//keytool -list -v  -alias androiddebugkey -keystore C:\Users\Jegadit\.android\debug.keystore