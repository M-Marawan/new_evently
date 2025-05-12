// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:evently/providers/language_provider.dart';
// import 'package:evently/ui/custom_button.dart';
// import 'package:evently/ui/custom_text_field.dart';
// import 'package:evently/utils/app_assets.dart';
// import 'package:evently/utils/app_colors.dart';
// import 'package:evently/utils/app_styles.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../custom_button.dart';
import '../custom_text_field.dart';

class SignUp extends StatefulWidget {
  static const String routeName = 'log_in';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
      int selectedIndex = 0;
    final Map<int, String> flags = {
    0: 'assets/images/LR.png',
    1: 'assets/images/EG.png',     
  };
  Widget build(BuildContext context) {
   var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height ;
     var language_provider = Provider.of<LanguageProvider>(context) ;
    return Scaffold(
      backgroundColor:  AppColors.lightBG ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                Image.asset(AppAssets.logo, width: width*0.3, height: height*0.3, alignment: Alignment.center ,),
                CustomTextField(hintText: "Name" , prefixIcon: Icon(Icons.person ),),
                SizedBox(height: height*0.02,) ,
                CustomTextField(hintText: "Email" , prefixIcon: Icon(Icons.email ),),
                SizedBox(height: height*0.02,) ,
                CustomTextField(hintText: "Password" , prefixIcon: Icon(Icons.lock ), suffixIcon: Icon(Icons.remove_red_eye_outlined ),),
                SizedBox(height: height*0.02,) ,
              CustomTextField(hintText: "Re Password" , prefixIcon: Icon(Icons.lock ), suffixIcon: Icon(Icons.remove_red_eye_outlined ),),
                SizedBox(height: height*0.02,) ,
                CustomButton(text: "Create Account", onPressed: (){}) ,
                SizedBox(height: height*0.02,) ,
                   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have Account ? " , style: AppStyles.inter500black16 ,) ,
                    TextButton(onPressed: (){}, 
                    child: Text("Login" , style: AppStyles.inter16PrimaryColor500.copyWith(
                      decoration: TextDecoration.underline ,
                     decorationColor: AppColors.mainColor
                       
                    ),
                    ),),
                  ],
                )
                ,
           
                SizedBox(height: height*0.02,) ,
               
                
                AnimatedToggleSwitch<int>.size(
                    current: selectedIndex,
                    
                    values: [0, 1],
                    iconOpacity: 1,  
                    indicatorSize: const Size.fromRadius(35),
                    borderWidth: 2,
                    height: 50,
                     
                    
                    style: ToggleStyle(
                      backgroundColor: Colors.white,
                      borderColor: Colors.blue,
                      indicatorColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),

                      
                    ),
                    styleBuilder: (i) => ToggleStyle(
                      indicatorColor: Colors.transparent,
                      
                    ),
                    iconBuilder: (value) {
                       return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(flags[value]! , ),
                            radius: 18,
                          ),
                        );
                    },
                    onChanged: (index) {
                      setState(() => selectedIndex = index);
                      if(selectedIndex==0){
                        language_provider.change_language("en") ;
                      }else {
                        language_provider.change_language("ar") ;
                      }
                            
                    },
                  ),
            ],
          ),
        ),
      ),

    );
  }
}