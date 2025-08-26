
part of './login_bloc.dart';



abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class EmailEvent extends LoginEvent {
  final String email;
  const EmailEvent({required this.email});
  
  @override
  
  List<Object?> get props => [email];
}

class PasswordEvent extends LoginEvent {
  final String password;
  const PasswordEvent({ required this.password});
  
  @override
  
  List<Object?> get props => [password];
}


class LoginApi extends LoginEvent{
  
}














// class EmailUnfocusEvent extends LoginEvent{
  
  
// }
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// class PasswordUnfocusEvent extends LoginEvent{



// }
  
  
