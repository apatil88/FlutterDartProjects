import 'package:flutter/material.dart';
import 'package:blog_app_flutter_redux/src/widgets/submit_button.dart';
import 'package:blog_app_flutter_redux/src/widgets/counter_text.dart';

class AddBlogPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux App"),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: "Post Title",
                    border: OutlineInputBorder(),
                    hintText: "Enter a post title"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Post Contents",
                    border: OutlineInputBorder(),
                    hintText: "Enter post contents"),
                maxLines: 3,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Post Category",
                    border: OutlineInputBorder(),
                    hintText: "Enter a category"),
              ),
              SizedBox(
                height: 10.0,
              ),
              SubmitButton(),
              Text('You updated the post following number of times:'),
              CounterText(),
            ],
          ),
        ),
      ),
    );
  }
}
