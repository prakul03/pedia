import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(PediaPredictApp());
}

class PediaPredictApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedia Predict',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      },
    );
  }
}
