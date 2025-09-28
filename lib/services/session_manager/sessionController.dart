import 'dart:convert';

import 'package:bloc_clean_coding/model/user/userModel.dart';
import 'package:bloc_clean_coding/services/storage/localStorage.dart';
import 'package:flutter/material.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();

  LocalStorage localStorage = LocalStorage();
  UserModel userModel = UserModel();

  bool? isLogin ;


  factory SessionController() {
    return _session;
  }

  SessionController._internal() {
    // init things
    isLogin = false;
  }

  Future<void>saveUserInPreference(dynamic userModel)async{
     localStorage.setValue('token', jsonEncode(userModel));
    //  isLogin = true;
    localStorage.setValue("isLogin", "true");
     
  }

  Future<void>getUserFromPreference()async{
    try{
      var userData = await localStorage.getValue("token");
      var isLogin = await localStorage.getValue("isLogin");
      if(userData != null && isLogin == "true" && userData.isNotEmpty){
         SessionController().userModel = UserModel.fromJson(jsonDecode(userData));
         
      }else{
        SessionController().isLogin = isLogin == "true" ? true : false;
      }

    }catch(err){
      debugPrint(err.toString());
    }
  }


  String? userId;
  String? token;

}