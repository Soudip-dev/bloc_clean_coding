


import 'package:bloc_clean_coding/bloc/loginBloc/login_bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:bloc_clean_coding/utils/validations.dart';

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
final emailController = TextEditingController();
final passController = TextEditingController();
late LoginBloc _loginBloc;

bool obscureText = true;
void cleanContrller(){
  
  emailController.clear();
  passController.clear();
  dispose();
}



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
      create: (context) {
        return _loginBloc;
      },
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
                    // _formKey.currentState!.validate();
                    print("Input Email : $value");
                    context.read<LoginBloc>().add(EmailEvent(email: value));
                    
                  },
                  
                controller:emailController  ,
                 hintText: "Enter Email" ,
                 validator: (value){
                  if ( value.toString().contains("@") && value.isEmpty) {
                    return "Please Enter Email";
                  }
                  // if(Validations().isValidEmail(value) ){
                  //  return "Please Enter Valid Email";
                  // }
                    
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
                  obscureText: obscureText ,
                  onChanged: (value) {
                    print("Input Password : $value");
                    context.read<LoginBloc>().add(PasswordEvent(password: value));
                    
                  },
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }, icon: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
                controller:passController  ,
                 hintText: "Password" ,

                 validator: (value){
                  
                  if (value.isEmpty ) {
                    return "Please Enter Password";
                  } else if(Validations.isValidPassword(value) ){
                    print(value);
                   return "Please Enter Valid Password";
                  }
                  
                  return null;
                 },
                 );
                 
             
               },),
                
              _spacer(55),
              BlocListener<LoginBloc, LoginInitialStates>(
                listenWhen: (previous, current) =>  previous.postApiStatus != current.postApiStatus,
                listener: (context, state) {
                if(state.postApiStatus== PostApiStatus.error){
                  print("Error Message : ${state.message}");
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                    SnackBar(content: Text(state.message.toString()))
                  );
                }else if(state.postApiStatus == PostApiStatus.success){
                  print("Success Message : ${state.message}");
                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                    SnackBar(content: Text(state.message.toString()))
                  );
                } else if (state.postApiStatus == PostApiStatus.loading){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                    SnackBar(content: Text("Submitting...."))
                  );

                }
              },
              child: 
             BlocBuilder<LoginBloc, LoginInitialStates>(
              
              buildWhen: (previous, current) => false,
              builder: (context, state) {
               return  ButtonWidget(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginApi());
                  // _formKey.currentState!.save();
                  // cleanContrller();
                }
              },
              text: "Login");
             },),
              
              )

          ],
        ),
        ),
    )
,
    )
   
    );
  }

  
}