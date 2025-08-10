import 'package:bloc_clean_coding/config/colors/colors.dart';
import 'package:flutter/material.dart';

class RoundBotton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  final double width;
  final Color color;

  const RoundBotton({Key?key, required this.title, required this.onPress, this.height = 60, this.width = 200,this.color = AppColors.buttonColor}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        
        height: height,
        width: width,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}