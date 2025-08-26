
 class Validations {
  bool isValidEmail(String email) {
   bool mailValidate=   RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
        if(mailValidate){
          return true;
        }else{
          return false;
        }
      
  }

static  bool isValidPassword(String password) {
    if (password.isEmpty) {
      return false;
    }else if(password.length >= 6){
      return false;
    }else{
      return true;
    }
    
  }
}
