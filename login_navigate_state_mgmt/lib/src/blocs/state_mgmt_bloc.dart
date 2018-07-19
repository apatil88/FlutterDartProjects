import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class StateMgmtBloc extends Object with Validator {
  //Private fields
  final _emailController = BehaviorSubject<
      String>(); //RxDart's implementation of StreamController. Broadcast stream by default
  final _passwordController = BehaviorSubject<String>();

  //Retreive data from the stream
  Stream<String> get emailStream => _emailController.stream
      .transform(performEmailValidation); //Return the transformed stream
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(performPasswordValidation);

  //Merging email and password streams
  Stream<bool> get submitValid =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Add data to the stream
  Function(String) get updateEmail => _emailController.sink.add;
  Function(String) get updatePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
