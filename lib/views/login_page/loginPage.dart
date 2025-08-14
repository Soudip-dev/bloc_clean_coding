import 'package:bloc_clean_coding/ui_componentes/normalTextfild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
final emailFocuse = FocusNode();
final passwordFocuse = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Login Page"),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               NormalTextfild(commonFocusNode:emailFocuse , nextFocusNode: primaryFocus , hintText: "Email" ,),
               SizedBox(height: 20,),
              NormalTextfild(commonFocusNode:passwordFocuse  , hintText: "Password" ,),

          ],
        ),
        ),
    )
    );
  }
}