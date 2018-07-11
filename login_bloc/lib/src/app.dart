import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Log Me In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
