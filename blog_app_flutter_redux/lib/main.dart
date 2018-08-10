import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:blog_app_flutter_redux/src/screens/add_post_screen.dart';
import 'package:blog_app_flutter_redux/src/models/app_state.dart';
import 'package:blog_app_flutter_redux/src/reducers/app_reducer.dart';
import 'package:redux_logging/redux_logging.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  //Set up a Redux store. Redux Store is the place where your entire application state lives. Your single source of truth!
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    //StoreProvider sets up communication between the Store and the child widgets part of the root widget
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AddBlogPostScreen(),
      ),
    );
  }
}
