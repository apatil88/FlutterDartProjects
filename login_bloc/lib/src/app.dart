import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/second_screen.dart';
import 'blocs/application_state_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return ApplicationStateProvider(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/secondscreen': (context) => SecondScreen(),
        },
      ),
    );
  }
}
