import 'package:flutter/material.dart';
import 'package:talarugbyclub/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tala RC',
      theme: ThemeData(
        primaryColor: Color(0xff15202C),
        primaryColorDark: Color(0xff1B2939),
        accentColor: Color(0xff1CA1F1),
        iconTheme: IconThemeData(color: Color(0xff1CA1F1))
      ),
      home: HomePage(),
    );
  }
}