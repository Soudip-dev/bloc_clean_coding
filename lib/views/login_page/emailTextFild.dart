import 'package:bloc_clean_coding/bloc/loginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextFild extends StatelessWidget {
  
  final FocusNode ? emailFocusNode;
  
   EmailTextFild({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginInitialStates>(
      builder: (context, state) {
        return TextFormField(
          focusNode: FocusNode(),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Email"
      ),
      onChanged: (value) {
        // print(value);
        context.read<LoginBloc>().add(EmailEvent(email: value));
      },

    );
      },
    );
    
  }
}