
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_evently/ui/profile_tab/profile_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/theme_provider.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import 'home_tab/home_tab.dart';
import 'love_tab/love_tab.dart';
import 'map_tab/map_tab.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0 ;
  List<Widget> tabs = [HomeTab() , MapTab() , LoveTab() , ProfileTab() ] ;
  @override
  Widget build(BuildContext context) {
    var theme_provider = Provider.of<ThemeProvider>(context) ;
    var height = MediaQuery.of(context).size.height ;
    return Scaffold(
      body: tabs[selectedIndex] ,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.transparent
        ) , 
        child: BottomAppBar(

        notchMargin: 6,
height: height*0.11,
          child:BottomNavigationBar(

iconSize: 20,
        elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index){

            selectedIndex = index ;
            setState(() {

            });
          },
          items: [
          NavigationBarItem(selectedIconImage: AppAssets.home_icon , label:  AppLocalizations.of(context)!.home,  index: 0 , unselectedIconImage: AppAssets.home_icon_selected),
          NavigationBarItem(selectedIconImage: AppAssets.map_icon , label: AppLocalizations.of(context)!.map , index: 1 , unselectedIconImage: AppAssets.map_icon_selected),

          NavigationBarItem(selectedIconImage: AppAssets.heart_icon , label: AppLocalizations.of(context)!.love , index: 2 , unselectedIconImage: AppAssets.heart_icon_selected),
          NavigationBarItem(selectedIconImage: AppAssets.profile_icon , label: AppLocalizations.of(context)!.profile, index: 3 , unselectedIconImage: AppAssets.profile_icon_selected )

        ]
        ) ,)
        ) ,  
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     floatingActionButton:  FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, 'add_event') ;
      }  ,
        
      // backgroundColor: AppColors.mainColor,
      shape: CircleBorder(side: BorderSide( color:AppColors.white, width: 6)),
      child: Icon(Icons.add  , color: AppColors.white, ),
      ),
    )  ;
  }

  BottomNavigationBarItem NavigationBarItem({required String selectedIconImage , required String label,required String unselectedIconImage , required int index , }){
   return BottomNavigationBarItem( 
      icon: selectedIndex!=index ?  ImageIcon(AssetImage(selectedIconImage),size: 20,) : ImageIcon(AssetImage(unselectedIconImage),size: 20,) ,
      label: label ,  ) ;
  }
}

// 