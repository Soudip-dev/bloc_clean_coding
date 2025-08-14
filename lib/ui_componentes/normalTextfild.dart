import 'package:flutter/material.dart';

class NormalTextfild extends StatelessWidget {
  final FocusNode  commonFocusNode;
  final FocusNode ? nextFocusNode;
  final String ? hintText;
  
  
   NormalTextfild({Key?key, required  this.commonFocusNode,  this.nextFocusNode, required this.hintText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: commonFocusNode,
                onFieldSubmitted: (value){
                  FocusScope.of(context).requestFocus(nextFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                
                },
               onChanged: (value) {
                 
               },
               decoration: InputDecoration(
                hintText: hintText
               ),

               );
  }
}