import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  // final String text;
  final Widget child;
  const ButtonWidget({Key?key, required this.onPressed,  required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.limeAccent
                ),
                onPressed:onPressed,
                child:child
              );
  }
}