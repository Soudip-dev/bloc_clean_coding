import 'package:bloc_clean_coding/config/components/roundBotton.dart';
import 'package:bloc_clean_coding/config/routes_name.dart';

import 'package:flutter/material.dart';

class SplshScreen extends StatelessWidget {
  const SplshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundBotton(title: "Home Page", onPress: (){
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }),
      ),
    );
  }
}