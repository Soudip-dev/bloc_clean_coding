part of "login_bloc.dart";


abstract class LoginStates extends Equatable {
  
  
  const LoginStates();
    
  @override
  List<Object?> get props => [];


}

class LoginInitialStates extends LoginStates {
  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;
  

  const LoginInitialStates( {
    this.email = '',  
    this.password = '', 
    this.message = '',
    
    this.postApiStatus = PostApiStatus.initial});
  

  LoginInitialStates copyWith({
    String? email,
    String? password,
    PostApiStatus? postApiStatus,
      
    String? message,

    
  }) {
    return LoginInitialStates(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: message ?? this.message,
      
    );
  }
  @override
  List<Object?> get props => [email, password, postApiStatus,message ];

  
      
}

 class PasswordUnFocusStates extends LoginStates {
    
   
   

 }


class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginErrorStates extends LoginStates {}

