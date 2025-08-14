import 'package:bloc_clean_coding/config/components/roundBotton.dart';
import 'package:bloc_clean_coding/config/routes_name.dart';
import 'package:bloc_clean_coding/services/splash/splashServices.dart';

import 'package:flutter/material.dart';

class SplshScreen extends StatefulWidget {
   SplshScreen({super.key});

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    
      super.initState();
    splashServices.login(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(height: 250,width: 250,color: Colors.cyan,child: Center(
          child: Text("Splash Screen"),
        ),)
        // RoundBotton(title: "Home Page", onPress: (){
        //   Navigator.pushNamed(context, RoutesName.homeScreen);
        // }),
      ),
    );
  }
}