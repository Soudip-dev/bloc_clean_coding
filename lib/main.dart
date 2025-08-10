import 'package:bloc_clean_coding/config/routes.dart';
import 'package:bloc_clean_coding/config/routes_name.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RoutesName.splshScreen,
      onGenerateRoute: Routes.generateRoute,
      
    );
  }
}
