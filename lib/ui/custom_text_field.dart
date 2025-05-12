
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  Color? borderColor ;
  String? hintText ; TextStyle? hintStyle ;
  Widget? suffixIcon ; 
   Widget? prefixIcon ; 
  int maxlines = 1 ;
  TextEditingController? controller ;
  String? Function(String?)? validator ;
  String? initialValue ;
  CustomTextField (
      { required this.hintText ,
  this.borderColor ,
   this.hintStyle , 
     this.prefixIcon  ,
      this.suffixIcon , 
      this.maxlines = 1 ,
      this.controller ,
      this.validator ,
        this.initialValue ,
      }) ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:  AppColors.mainColor,
      maxLines: maxlines ,
      controller: controller ,
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
           borderSide: BorderSide(
            color: borderColor ?? AppColors.grey ,
            width: 1
           ) ,
           
        ), 
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
           borderSide: BorderSide(
            color: borderColor ?? AppColors.grey ,
            width: 1
           ) ,
           
        ), 
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
           borderSide: BorderSide(
            color: AppColors.red ,
            width: 1
           ) ,
           
        ), 
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(16) ,
           borderSide: BorderSide(
            color: AppColors.red ,
            width: 1
           ) ,
           
        ), 
     hintText: hintText , hintStyle: hintStyle ?? AppStyles.inter16Gray500 ,
     prefixIcon: prefixIcon , prefixIconColor:   borderColor ?? AppColors.grey ,
     suffixIcon: suffixIcon , suffixIconColor:  borderColor ?? AppColors.grey ,
      ),
      
    );
  }
}