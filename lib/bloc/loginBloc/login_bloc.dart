import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part  'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvent, LoginInitialStates> {
  LoginBloc() : super(const LoginInitialStates()) {
    on<EmailEvent>(_onEmailChange);
    on<PasswordEvent>(_onPasswordChange);
  }

  void _onEmailChange(EmailEvent event, Emitter<LoginInitialStates> emit) {
    print("<<<<<<<<<<<<<<<<_onEmailChange>>>>>>>>>>>>>>>>");
    print("Email>>>> : ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordEvent event, Emitter<LoginInitialStates> emit) {
    print("<<<<<<<<<<<<<<<<onPasswordChange>>>>>>>>>>>>>>>>");
    print("password>>>> : ${event.password}");
    emit(state.copyWith(password: event.password));
  
  }

}