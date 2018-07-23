import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsHack',
      home: NewsList(),
    );
  }
}
