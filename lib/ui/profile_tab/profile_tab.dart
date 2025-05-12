// import 'package:evently/providers/language_provider.dart';
// import 'package:evently/providers/theme_provider.dart';
// import 'package:evently/utils/app_assets.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:evently/utils/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/app_theme.dart';
// import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

     

  
 @override
  Widget build(BuildContext context) {
     
    List<String> languages = [AppLocalizations.of(context)!.arabic, AppLocalizations.of(context)!.engish ];
    List<String> themes = [AppLocalizations.of(context)!.light, AppLocalizations.of(context)!.dark ];
    
    String  selectedLanguage = AppLocalizations.of(context)!.engish ;
    String  selectedTheme =AppLocalizations.of(context)!.theme ;
      
    var language_provider = Provider.of<LanguageProvider>(context) ;
    var theme_provider = Provider.of<ThemeProvider>(context) ;
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height ;
    return Scaffold(
      
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              height: height*0.185  , width: width,
              decoration: BoxDecoration(
                color:  AppColors.mainColor ,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64)) 
              ),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,) ,
                 ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(1000) , bottomRight:Radius.circular(1000) ,topRight:Radius.circular(1000) ,topLeft:Radius.circular(24)),
                    child: Image.asset(
                     AppAssets.profile,
                      width: 124,
                      height: 124,
                       
                    ),
                  ),
                   SizedBox(width: 10,) ,
                   Flexible(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Safwat", style: AppStyles.inter24White700 ) ,
                      Text("johnsafwat.route@gmail.com " ,
                       style:  AppStyles.inter16White500 ,
                        overflow: TextOverflow.ellipsis ,
                        maxLines: 1,
                       
                        )
                    ],
                  ),)
                  
                ],

              ),
            ),
              SizedBox(height: 10) ,
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                   AppLocalizations.of(context)!.language,
                    
                  ),
              ),
             SizedBox(height: 10) ,
              Padding(
                  padding: EdgeInsets.only(left: 16.0 ,right: 16),
                  child: Container(
                    width: double.infinity ,
                    decoration: BoxDecoration(
                       
                      border: Border.all(color: AppColors.mainColor , style: BorderStyle.solid ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,  
                      children: [
                         
                        SizedBox(width: 8),
                        Expanded( 
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              
                              value: language_provider.current_language=="en" ? AppLocalizations.of(context)!.engish : AppLocalizations.of(context)!.arabic ,
                              style: AppStyles.inter20MainColor700 ,
                              onChanged: (String? newValue) {
                                setState(() {
                                  newValue == AppLocalizations.of(context)!.engish ? language_provider.change_language("en") : language_provider.change_language("ar") ; 
                                });
                              },
                              items: languages.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


              ),
             SizedBox(height: 10) ,
              Padding(
                  padding: EdgeInsets.only(left: 16 ,right: 16),
                  child: Text(
                    AppLocalizations.of(context)!.theme,
                  
                  ),
              ),
              SizedBox(height: 10) ,
              Padding(
                  padding: EdgeInsets.only(left: 16.0 ,right: 16),
                  child: Container(
                    width: double.infinity ,
                    decoration: BoxDecoration(
                       
                      border: Border.all(color: AppColors.mainColor , style: BorderStyle.solid ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,  
                      children: [
                         
                        SizedBox(width: 8),
                        Expanded( 
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              
                              value: theme_provider.current_theme== AppTheme.lightTheme ? AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark ,
                              style: AppStyles.inter20MainColor700 ,
                              onChanged: (String? newValue) {
                                setState(() {
                                  newValue == AppLocalizations.of(context)!.light ? theme_provider.change_theme(AppTheme.lightTheme) : theme_provider.change_theme(AppTheme.darkTheme)  ; 
                                });
                              },
                              items: themes.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


              ),     
          ],
       ),
    );
  }
}