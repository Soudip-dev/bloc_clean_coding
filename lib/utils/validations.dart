
 class Validations {
  bool isValidEmail(String email) {
   bool mailValidate=   RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
        return mailValidate;
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
