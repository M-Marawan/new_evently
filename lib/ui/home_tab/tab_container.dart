// import 'package:evently/utils/app_colors.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

Widget tab({required BuildContext context, required String name, required Icon icon, required int Index, required int selectedIndex , required Color selectedBG , required Color unselectedBG , required Color selectedText , required Color unselectedText , required Color borderColor})  {
    IconData iconData = (icon).icon!;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46) ,
        //  border: Border.all(color: Theme.of(context).primaryColorLight    ) , 
        border: Border.all(color: borderColor ) ,
        // color:  Index==selectedIndex ? Theme.of(context).cardColor : AppColors.transparent
           color: Index==selectedIndex ? selectedBG : unselectedBG
        ) ,
      padding: EdgeInsets.symmetric( horizontal: 16 , vertical:  8),
      
        
        child:  Row(
        
        children: [
         Icon(iconData,
            // color: Index==selectedIndex ? Theme.of(context).primaryColorDark : Colors.white,
            color: Index==selectedIndex ? selectedText : unselectedText,
            size: 20,
          ) ,
          SizedBox(width: 5,) ,
          Text(name,
              style: TextStyle(
                // color: Index==selectedIndex ?Theme.of(context).primaryColorDark : Colors.white,
                color: Index==selectedIndex ? selectedText : unselectedText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ] ,

       )  ,
       
     
    );
  }