import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
part  'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvent, LoginInitialStates> {
  LoginRepository loginRepository =LoginRepository();
  LoginBloc() : super(const LoginInitialStates()) {
    on<EmailEvent>(_onEmailChange);
    on<PasswordEvent>(_onPasswordChange);
    on<LoginApi>(_onLogin);
  }

  void _onLogin(LoginApi event, Emitter<LoginInitialStates> emit) async {
       print("from login api: ${state.email} ${state.password}");
      Map data = {"email": state.email, "password": state.password };
      // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka" };
       emit(state.copyWith(postApiStatus: PostApiStatus.loading));

     await  loginRepository.loginApi(data).then((value){
        print("<<<<<<<<<<<<<<<value>>>>>>>>>>>>>>>>>>>");
        print(value.toJson());
        if(value.error.isEmpty){
          print("Login Successfull");
          emit(state.copyWith(message: "Login Successfull\n${value.token}"));
          emit(state.copyWith(postApiStatus: PostApiStatus.success));
        }else{
          print("<<<<<<<<<<<<<<<error1>>>>>>>>>>>>>>>>>>>");
          emit(state.copyWith(message: value.error));
          emit(state.copyWith(postApiStatus: PostApiStatus.error));
        }
        
        

       }).onError((error, stackTrace){
        print("<<<<<<<<<<<<<<<error2>>>>>>>>>>>>>>>>>>>$error");
        emit(state.copyWith(message: error.toString()));
        emit(state.copyWith(postApiStatus: PostApiStatus.error));
       });
    
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



