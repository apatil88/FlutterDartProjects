class ValidationMixin {
  String validateEmail(String value) {
    //return null if valid
    //otherwise return string (with the error message) if invalid
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Please enter a password with at least 4 characters';
    }
    return null;
  }
}
