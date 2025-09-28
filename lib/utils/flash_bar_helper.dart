import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';


class FlashBarHelper {
  static flashBarErrorMessage(BuildContext context, {required String message, required Color color,  Icon ? icon} ) {
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      duration: Duration(seconds: 7),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal:20 , vertical: 10,),
      padding: EdgeInsets.all(10),
      message: message,
      backgroundColor: color,
      borderRadius: BorderRadius.circular(10),
      icon: icon,


    )..show(context) );
  }

}