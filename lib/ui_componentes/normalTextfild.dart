import 'package:flutter/material.dart';


class NormalTextfild extends StatelessWidget {
  final TextEditingController  controller;
  
  final String ? hintText;
  final bool  obscureText;
  final Widget ? suffixIcon;
  final Function(dynamic)? onChanged;
  final dynamic validator;
  
  
  
   NormalTextfild({Key?key, 
   required  this.controller,  
   
   required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
   required this.validator,
   this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  
    
    TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: controller,
                // focusNode: commonFocusNode,
              
                onFieldSubmitted: (value){
                  
                  // FocusScope.of(context).requestFocus(nextFocusNode);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator,
                obscureText: obscureText ,
               onChanged: onChanged,
               decoration: InputDecoration(
                suffixIcon: suffixIcon ,
                // filled: true,
                hintText: hintText,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.3,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  // Added error border style
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.red, // Adjust the error border color
                    width: 0.3,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  // Added focused error border style
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.red, // Adjust the focused error border color
                    width: 0.3,
                  ),
                )),
               

               );
 
    }
   
  }
