class Validator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains("@")) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }
}
