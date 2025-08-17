part of "login_bloc.dart";


abstract class LoginStates extends Equatable {
  
  
  const LoginStates();
    
  @override
  List<Object?> get props => [];


}class LoginInitialStates extends LoginStates {
  final String email;
  final String password;
  const LoginInitialStates( {this.email = '',  this.password = ''});
  

  LoginInitialStates copyWith({
    String? email,
    String? password,
  }) {
    return LoginInitialStates(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  @override
  List<Object?> get props => [email, password];

  
      
}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class LoginErrorStates extends LoginStates {}

