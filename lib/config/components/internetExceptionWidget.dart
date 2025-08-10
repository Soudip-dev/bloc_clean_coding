import 'package:bloc_clean_coding/config/colors/colors.dart';
import 'package:bloc_clean_coding/config/components/roundBotton.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SizedBox(height:  MediaQuery.sizeOf(context).height * 0.15,),
        Icon(
          Icons.cloud_off,
          color: AppColors.errColor,
          size: 100,
        ),
        Padding(
          padding:  EdgeInsets.only(top:  30.0, bottom: 45),
          child: Center(
            child: Text("We are unable to show result \n please check your internet connection \nand \n try again",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
          ),
        ),
        RoundBotton(title: "Retry", onPress: (){},width: MediaQuery.sizeOf( context).width * 0.65,)
      ]
    );
  }
}