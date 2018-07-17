import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

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

  Animation<double> boxAnimation;
  AnimationController boxController;

  //Lifecycle method called when a new instance of HomeState is created. Only available for classes which extend the State class.
  initState() {
    //initState() is actually defined in the superclass State.
    super.initState();

    boxController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.linear,
      ),
    );

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    boxController.forward();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this, //Mixed in TickerProvider to our current class
    );

    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
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
      //If the cat is going into the box, move the flaps.
      boxController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      //If the cat is coming out of the box, freeze the flaps.
      boxController.stop();
      catController.forward();
    }
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat\'s Out of the Box'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            children: <Widget>[
              buildCatAnimation(), //cat will be at the bottom of the stack
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
            overflow: Overflow.visible,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation
              .value, //move the cat. Position the cat without changing the dimensions of the stack.
          right: 0.0,
          left: 0.0,
        );
      }, //child is used for performance since we want to prevent complete re-rendering of Cat for every animation tick and just work with a some particular widget property
      child:
          Cat(), //Single instance of Cat is going to be repeatedly passed into the builder function everytime the animation udpates
    );
  }

  Widget buildBox() {
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
            height: 12.0,
            width: 130.0,
            color: Colors.brown,
          ),
          builder: (context, child) {
            return Transform.rotate(
              child: child,
              angle: boxAnimation.value,
              alignment: Alignment
                  .topLeft, //Move the rotation point of our flap to the top left.
            );
          }),
      left: 3.0,
      top: 1.0,
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
            height: 12.0,
            width: 130.0,
            color: Colors.brown,
          ),
          builder: (context, child) {
            return Transform.rotate(
              child: child,
              angle: -boxAnimation.value,
              alignment: Alignment
                  .topRight, //Move the rotation point of our flap to the top left.
            );
          }),
      right: 3.0,
      top: 1.0,
    );
  }
}
