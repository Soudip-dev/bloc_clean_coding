import 'dart:async';

import 'package:bloc_clean_coding/config/routes_name.dart';
import 'package:flutter/widgets.dart';

class SplashServices {
   void login(BuildContext context){
    Timer(const Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen,  (route) => false));
   }
}