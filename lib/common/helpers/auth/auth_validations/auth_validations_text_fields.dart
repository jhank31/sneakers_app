class AuthValidationsTextFields {
  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
