// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:evently/firebase/fireStore.dart';
// import 'package:evently/models/event_model.dart';
// import 'package:evently/providers/event_provider.dart';
// import 'package:evently/providers/language_provider.dart';
// import 'package:evently/ui/home_tab/evevt_tab.dart';
// import 'package:evently/ui/home_tab/tab_container.dart';
// import 'package:evently/utils/app_assets.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:flutter/material.dart';
import 'tab_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../../providers/language_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'evevt_tab.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_tab';
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  


 

  List<Icon> tabIcons = [
  Icon(Clarity.compass_line),
  Icon( Icons.directions_bike_outlined ) ,
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),
  Icon(Iconsax.cake_bold),


   
];

  @override
  Widget build(BuildContext context) {
     var language_provider = Provider.of<LanguageProvider>(context) ;
     var event_provider = Provider.of<eventProvider>(context) ;
event_provider.getTabs(context) ;
    var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height ;

     if(event_provider.events.isEmpty){
       event_provider.gitAllEvents() ;
     }
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Column(
                children: [
                   SizedBox(height: 10,) ,
                  Text(AppLocalizations.of(context)!.welcome , style: AppStyles.inter14White400 ,) ,
                  Text("John Safwat" , style: AppStyles.inter20White700) ,
                ],
              ),
              Row(
                children: [
                  Icon(Icons.sunny , color: AppColors.white,),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin:EdgeInsets.all(8) ,
                    decoration: BoxDecoration(
                      color: AppColors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(8) )
                    ),
                    child: Text(language_provider.current_language == "en" ? "EN" : "AR" , style: AppStyles.inter14PrimaryColor700 ,),
                  )
                ],
              )

            ],

          ),
          bottom: AppBar(
            title: Row(
              children: [
                ImageIcon(AssetImage(AppAssets.map_icon) , color: AppColors.white, ) ,
                Text(" ${AppLocalizations.of(context)!.cairo } , ${AppLocalizations.of(context)!.egypt }" , style: AppStyles.inter16White500 ,)
              ],
            ),
          ),

      ),
      body: Column(
        children: [
            Container(
        height: height*0.07  , width: width,
        decoration: BoxDecoration(
          color:  Theme.of(context).primaryColor ,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24) , bottomRight: Radius.circular(24)) 
        ), 
        child: DefaultTabController(length: event_provider.tabs.length , child:TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start ,
          dividerHeight: 0 ,
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
            indicator: BoxDecoration() ,
            onTap: (value) {
              // event_provider.selectedIndex = value ;

              event_provider.changeSelectedIndex(value) ;
              // event_provider.getFilterdEvents() ;
              // setState(() {
              //
              // });
              },
          tabs: event_provider.tabs.asMap().entries.map((entry) {
            int index = entry.key; String eventName = entry.value;
                return tab(
                  context: context,
                  selectedIndex: event_provider.selectedIndex,
                  name: eventName,
                  icon: tabIcons[index],
                  Index: index,
                  selectedBG: AppColors.white ,
                  unselectedBG: AppColors.transparent,
                  selectedText: AppColors.mainColor ,   
                  unselectedText: AppColors.white,  

                  borderColor: Theme.of(context).primaryColorLight ,
                );
              }).toList() ,
              
          
          
          ), )
      ),
            SizedBox(height: 10,) ,

            Expanded(

              child: event_provider.filterdEvents.isEmpty ?
              Center(
                child: Text("No available  events" , style: AppStyles.inter500black16,),
              )
                  :
              ListView.separated(
                itemBuilder:(context, index) => EvevtTab(event: event_provider.filterdEvents[index],)  ,
                itemCount: event_provider.filterdEvents.length,
                separatorBuilder:  (context, index) {
                  return SizedBox(height: 10,) ;
                } ,
              )
            )
        ],
      )
      
       
    );
  }


 
}
  