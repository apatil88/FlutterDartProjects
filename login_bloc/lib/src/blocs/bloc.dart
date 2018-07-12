import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  //Private fields
  final _emailController = StreamController<
      String>(); //Since we will only be dealing with string data
  final _passwordController = StreamController<String>();

  //Retreive data from the stream
  Stream<String> get email => _emailController.stream
      .transform(validateEmail); //Return the transformed stream
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  //Add data to the stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//Single Global Instance of Bloc
//final bloc = Bloc();
