import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation; //To change the position of the cat vertically
  AnimationController
      catController; //To perform and set the duration of the animation

  //Lifecycle method called when a new instance of HomeState is created. Only available for classes which extend the State class.
  initState() {
    //initState() is actually defined in the superclass State.
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this, //Mixed in TickerProvider to our current class
    );

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        //rate at which the animated value changes
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  onTap() {
    //Start the animation
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cat\'s Out of the Box'),
        ),
        body: GestureDetector(
          child: buildAnimation(),
          onTap: onTap,
        ));
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      }, //child is used for performance since we want to prevent complete re-rendering of Cat for every animation tick and just work with a some particular widget property
      child:
          Cat(), //Single instance of Cat is going to be repeatedly passed into the builder function everytime the animation udpates
    );
  }
}
