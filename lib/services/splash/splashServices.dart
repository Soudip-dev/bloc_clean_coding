import 'dart:async';

import 'package:bloc_clean_coding/config/routes_name.dart';
import 'package:bloc_clean_coding/services/session_manager/sessionController.dart';
import 'package:flutter/widgets.dart';

class SplashServices {

   void login(BuildContext context){
   SessionController().getUserFromPreference().then((value){

     print(SessionController().isLogin);


     if(SessionController().isLogin ?? false){
       Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeScreen,  (route) => false));
     }else{
        Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen,  (route) => false));
     }
   }).onError((err, stackTrace){

   });
    Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen,  (route) => false));
   }
}