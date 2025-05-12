
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData lightTheme =  ThemeData(
     scaffoldBackgroundColor: AppColors.lightBG ,
     primaryColor: AppColors.mainColor,
    primaryColorLight: AppColors.white ,
    primaryColorDark: AppColors.mainColor ,
    cardColor: AppColors.white ,
     appBarTheme: AppBarTheme(
      backgroundColor: AppColors.mainColor,
      iconTheme: IconThemeData(color:AppColors.mainColor), 
       actionsIconTheme: IconThemeData(color:AppColors.mainColor),
     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      
      showUnselectedLabels: true ,
      selectedLabelStyle: AppStyles.bold12white ,
      unselectedLabelStyle:  AppStyles.bold12white
     ),
     bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
         
        color:AppColors.mainColor, 
     ),
     textTheme: TextTheme(
      bodyMedium: AppStyles.inter20Black700  ,
     ),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
     ) ,
  
  ) ;
 
 
  static ThemeData darkTheme =  ThemeData(
     scaffoldBackgroundColor: AppColors.darkBG ,
     primaryColor: AppColors.darkBG ,
     primaryColorLight: AppColors.mainColor ,
         cardColor: AppColors.mainColor ,
         primaryColorDark: AppColors.white ,

     appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBG ,
      iconTheme: IconThemeData(color:AppColors.mainColor), 
      actionsIconTheme: IconThemeData(color:AppColors.darkBG), 
     ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true ,
      selectedLabelStyle: AppStyles.bold12white ,
      unselectedLabelStyle:  AppStyles.bold12white
     ),
     bottomAppBarTheme: BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
         
        color:AppColors.darkBG, 
     ),
     textTheme: TextTheme(
      bodyMedium: AppStyles.inter20White700  ,
     ),
       floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkBG,
     )
  ) ;
}