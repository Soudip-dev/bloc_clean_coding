import 'package:flutter/material.dart';

class NormalTextfild extends StatelessWidget {
  final FocusNode  commonFocusNode;
  final FocusNode ? nextFocusNode;
  final String ? hintText;
  
  final Function(dynamic)? onChanged;
  final dynamic validator;
  
  
  
   NormalTextfild({Key?key, 
   required  this.commonFocusNode,  
   this.nextFocusNode, 
   required this.hintText,
    
   required this.validator,
   this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: commonFocusNode,
                onFieldSubmitted: (value){
                  
                  FocusScope.of(context).requestFocus(nextFocusNode);
                },
                validator: validator,
                
               onChanged: onChanged,
               decoration: InputDecoration(
                hintText: hintText
               ),

               );
  }
}