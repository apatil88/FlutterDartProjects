import 'package:flutter/material.dart';
import 'state_mgmt_bloc.dart';

class ApplicationStateProvider extends InheritedWidget {
  final stateMgmtBloc = StateMgmtBloc();

  //Take the LoginScreen Widget and push it to the InheritedWidget super class
  ApplicationStateProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static StateMgmtBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ApplicationStateProvider)
            as ApplicationStateProvider)
        .stateMgmtBloc;
  }
}
