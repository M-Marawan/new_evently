// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  Color? color;
  TextStyle? textStyle;
  CustomButton({required this.text ,required this.onPressed , this.color , this.textStyle});  

  @override
  Widget build(BuildContext context) {
  
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
  return  SizedBox(
      width: double.infinity, 
      height: height*0.08, 
      child: ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.mainColor ,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: AppColors.mainColor,
              width: 1.5,
            ),
          ),
        
        ),
        child: Text(text, style: textStyle ?? AppStyles.inter20White700),
      ),
    );
  }
}