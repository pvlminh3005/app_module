class Validator {
  Validator._();

  static String? validateEmail(String? value) {
    const String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!regex.hasMatch(value)) {
      return 'Email formatter not correct';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    const String pattern = r'^.{6,}$';
    final RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(value)) {
      return 'Password must be at least 6 characters.';
    } else {
      return null;
    }
  }
}
