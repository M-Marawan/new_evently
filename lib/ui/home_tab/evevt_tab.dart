// import 'package:evently/models/event_model.dart';
// import 'package:evently/providers/event_provider.dart';
// import 'package:evently/utils/app_assets.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// import 'add_event.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/event_model.dart';
import '../../providers/event_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'add_event.dart';

class EvevtTab extends StatelessWidget {
  Event event ;
   EvevtTab({super.key , required  this.event}) ;

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height ;
     var event_provider = Provider.of<eventProvider>(context) ;

   return InkWell(
     child: Container(
       height: height*0.25 ,

       padding: EdgeInsets.all(8),
       margin: EdgeInsets.all(8),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(16),
         border: Border.all(width: 1),
         image: DecorationImage(
           image: AssetImage(event.image) ,
           fit: BoxFit.cover,
         ) ,
       ),child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         FittedBox(
           child: Container(
             padding: EdgeInsets.all(8),
             decoration: BoxDecoration(
               color: AppColors.lightBG,
               borderRadius: BorderRadius.circular(8),
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text( event.dateTime.day.toString() , style: AppStyles.inter20MainColor700),
                 Text(DateFormat('MMM').format(event.dateTime).toString(), style: AppStyles.inter14MainColor700),
               ],
             ),
           ),
         )
         ,
         Container(
           width: double.infinity , height: height*0.04 ,
           padding: EdgeInsets.all(8),

           decoration: BoxDecoration(
               color: AppColors.lightBG ,
               borderRadius: BorderRadius.circular(8)
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Expanded(child:Text(event.description , style: AppStyles.inter14MainColor700 ,) , ),

               IconButton(
                 onPressed: (){
                   event_provider.updateFavorite(event) ;



                 },
                 icon: event.isFavorite ? Icon(Icons.favorite): Icon(Icons.favorite_border) , color: AppColors.mainColor, )
             ],
           ),

         )
       ],
     ),
     ) ,
     onTap: (){
       Navigator.pushNamed(context, AddEvent.routeName , arguments: event) ;

     }
   ) ;
  }
}