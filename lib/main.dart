import 'package:bloc_clean_coding/config/routes.dart';
import 'package:bloc_clean_coding/config/routes_name.dart';
import 'package:bloc_clean_coding/repository/auth/login_http_api_repository.dart';


import 'package:bloc_clean_coding/repository/auth/login_repository.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
GetIt getIt = GetIt.instance;


void main() {
  servisesLocator();
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


servisesLocator(){
  
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpRepository());
}