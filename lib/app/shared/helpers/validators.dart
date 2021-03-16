class AppValidators {
  static String validateEmail(String emailAddress) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(pattern).hasMatch(emailAddress)) {
      return 'Please, insert a valid email!';
    }
    return null;
  }

  static String validateEmptyPassword(String value) {
    if (value.isEmpty) {
      return 'Please, insert your password';
    }
    return null;
  }

  static String validateNewPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'The password must contain: \n \t * At least 6 characters \n \t * At least 1 upper case letter; \n \t * At least 1 lower case letter; \n \t * At least 1 number; \n \t * At least 1 special character;';
    }
    return null;
  }

  static String validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords must match!';
    }
    return null;
  }
}
