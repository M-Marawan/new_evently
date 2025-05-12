// import 'package:evently/providers/event_provider.dart';
// import 'package:evently/ui/custom_text_field.dart';
// import 'package:evently/ui/home_tab/evevt_tab.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:evently/providers/event_provider.dart';
//
// import '../../providers/event_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/event_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../custom_text_field.dart';
import '../home_tab/evevt_tab.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    var event_provider = Provider.of<eventProvider>(context) ;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30, ) ,
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField( 
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: AppStyles.inter14PrimaryColor700,
              borderColor: AppColors.mainColor,
              prefixIcon: Icon(Icons.search_sharp),
            ),
          ) ,
          Expanded(
              child: ListView.separated(
                itemBuilder:(context, index) =>  EvevtTab(event: event_provider.favoriteEvents[index],)  ,    //EvevtTab()
                itemCount: event_provider.favoriteEvents.length ,
                separatorBuilder:  ( context, index) {
                  return SizedBox(height: 10,) ;
                } ,
              )
            )
        ],
      ),
    );
  }
}