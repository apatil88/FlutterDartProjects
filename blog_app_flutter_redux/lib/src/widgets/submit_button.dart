import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:blog_app_flutter_redux/src/actions/counter_actions.dart';
import 'package:blog_app_flutter_redux/src/models/app_state.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provides widget access to the Store
    return StoreConnector<AppState, VoidCallback>(
      //callback that is called when the user interacts with the view.
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(IncrementCountAction()); //Dispatch the action
        };
      },
      builder: (BuildContext context, VoidCallback increase) {
        return RaisedButton(
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          padding: EdgeInsets.all(10.0),
          splashColor: Colors.blueGrey,
          child: const Text(
            'Submit Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
            ),
          ),
          textColor: Colors.white,
          onPressed: increase,
        );
      },
    );
  }
}
