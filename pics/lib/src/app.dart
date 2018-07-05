import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; //We only need this function

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  void fetchImage() {
    counter += 1;
    get('http://jsonplaceholder.typicode.com/photos/${counter}');
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage, //Call the function to fetch image data
          child: Icon(Icons.add),
        ),
        body: Text('${counter} images'),
      ),
    );
  }
}
