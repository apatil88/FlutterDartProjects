import 'package:flutter/material.dart';
import 'package:blog_app_flutter_redux/src/widgets/counter_text.dart';

class DisplayPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux App"),
      ),
      body: CounterText(),
    );
  }
}
