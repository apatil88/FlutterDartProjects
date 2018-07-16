import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  Animation<double> catAnimation; //To change the position of the cat vertically
  AnimationController
      catController; //To perform and set the duration of the animation

  //Lifecycle method called when a new instance of HomeState is created. Only available for classes which extend the State class.
  initState() {
    super
        .initState(); //initState() is actually defined in the superclass State.
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat\'s Out of the Box'),
      ),
      body: buildAnimation(),
    );
  }

  Widget buildAnimation() {
    return Cat();
  }
}
