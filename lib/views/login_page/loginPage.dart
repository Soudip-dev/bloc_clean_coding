
import 'dart:math';

import 'package:bloc_clean_coding/bloc/loginBloc/login_bloc.dart';
import 'package:bloc_clean_coding/utils/validations.dart';
import 'package:bloc_clean_coding/views/login_page/emailTextFild.dart';
import 'package:flutter/material.dart';
import 'package:bloc_clean_coding/ui_componentes/formWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
SizedBox _spacer([double height = 20]) => SizedBox(height: height,);
  final _formKey = GlobalKey<FormState>();
final emailFocuse = FocusNode();
final passwordFocuse = FocusNode();
late LoginBloc _loginBloc;
@override
  void initState() {
    
      _loginBloc = LoginBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Login Page"),
    ),
    body: BlocProvider(
      create: (context) => _loginBloc,
      child: 
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           BlocBuilder<LoginBloc, LoginInitialStates>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
                print("Email state : ${state.email}");
                 return NormalTextfild(
                  onChanged: (value) {
                    print("Input Email : $value");
                    context.read<LoginBloc>().add(EmailEvent(email: value));
                  },
                commonFocusNode:emailFocuse  ,
                 hintText: "Enter Email" ,
                 validator: (value){
                  if (state.email.isEmpty || !state.email.contains("@") || value!.isEmpty) {
                    return "Please Enter Email";
                  }
                  if(Validations().isValidEmail(value) ){
                   return "Please Enter Valid Email";
                  }
                  return null;
                 },
                 );
                 
             
               },),
            //  EmailTextFild(emailFocusNode: emailFocuse,),
              
               _spacer(),
               BlocBuilder<LoginBloc, LoginInitialStates>(
                buildWhen: (previous, current) => previous.password != current.password,
                builder: (context, state) {
                print("Password state : ${state.password}");
                 return NormalTextfild(
                  onChanged: (value) {
                    print("Input Password : $value");
                    context.read<LoginBloc>().add(PasswordEvent(password: value));
                  },
                commonFocusNode:passwordFocuse  ,
                 hintText: "Password" ,
                 validator: (value){
                  if (value!.isEmpty ) {
                    return "Please Enter Password";
                  }
                  if(Validations().isValidPassword(value) ){
                   return "Please Enter Valid Password";
                  }
                  return null;
                 },
                 );
                 
             
               },),
                
              _spacer(55),
             BlocBuilder<LoginBloc, LoginInitialStates>(
              
              buildWhen: (previous, current) => false,
              builder: (context, state) {
               return  ButtonWidget(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Data saved 1");
                  _formKey.currentState!.save();
                  print("Data saved 2");
                }
              },
              text: "Login");
             },)

          ],
        ),
        ),
    )
,
    )
   
    );
  }

  
}