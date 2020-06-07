import 'package:flutter/material.dart';
import 'package:marwaha/core/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),

      // (i
      //  // primaryColor: Colors.black,
      //  // primaryColorLight: Colors.white,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
