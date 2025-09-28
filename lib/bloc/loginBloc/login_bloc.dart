import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/repository/auth/login_http_api_repository.dart';
import 'package:bloc_clean_coding/repository/auth/login_mock_api_repository.dart';
import 'package:bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:bloc_clean_coding/services/session_manager/sessionController.dart';




import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part  'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvent, LoginInitialStates> {
  // LoginHttpRepository loginRepository =LoginHttpRepository();
  // LoginMockRepository loginRepository =LoginMockRepository();
  LoginRepository loginRepository ;
   
  LoginBloc({required this.loginRepository}) : super(const LoginInitialStates()) {
    on<EmailEvent>(_onEmailChange);
    on<PasswordEvent>(_onPasswordChange);
    on<LoginApi>(_onLogin);
  }

  void _onLogin(LoginApi event, Emitter<LoginInitialStates> emit) async {
       
      Map data = {"email": state.email, "password": state.password };
      // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka" };
       emit(state.copyWith(postApiStatus: PostApiStatus.loading));

     await  loginRepository.loginApi(data).then((value)async{
      print("value>>>>>>>>>>>>>>>>>>>$value");
        // debugPrint("value:>>>>>>>>>>>>>>${value.error}");
        // debugPrint("value:>>>>>>>>>>>>>>${value.token}");
        
        


        if(value.error.isEmpty || value.error == " " ){
         print("<<<<<<<<<<<<<<<<<success>>>>>>>>>>>>>>>>>>>");
        await  SessionController().saveUserInPreference(value);
        await  SessionController().getUserFromPreference();
  emit(state.copyWith(message: "Login Successfull", postApiStatus: PostApiStatus.success));

        }else{

          print("<<<<<<<<<<<<<<<error w eww>>>>>>>>>>>>>>>>>>>");
          emit(state.copyWith(message: value.error.toString(), postApiStatus: PostApiStatus.error));

        }

       }).onError((error, stackTrace){
        debugPrint("<<<<<<<<<<<<<<<error2>>>>>>>>>>>>>>>>>>>$error");
        emit(state.copyWith(message: error.toString(), postApiStatus: PostApiStatus.error));
        
       });
    
  }

  void _onEmailChange(EmailEvent event, Emitter<LoginInitialStates> emit) {
    
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordEvent event, Emitter<LoginInitialStates> emit) {
    
    emit(state.copyWith(password: event.password));
  
  }

 

}



