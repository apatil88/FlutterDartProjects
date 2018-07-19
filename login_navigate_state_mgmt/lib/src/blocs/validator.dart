import 'dart:async';

class Validator {
  final performEmailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailValidationRule);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Please enter a valid email address');
    }
  });

  final performPasswordValidation =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    String passwordValidationRule =
        '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,10})';
    RegExp regExp = new RegExp(passwordValidationRule);

    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'Password contain one digit, one lowercase, one uppercase, one special symbol "@#%" and be min. 6 to max. 10 characters long');
    }
  });
}
