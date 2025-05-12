// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:evently/firebase_options.dart';
// import 'package:evently/providers/event_provider.dart';
// import 'package:evently/providers/language_provider.dart';
// import 'package:evently/providers/theme_provider.dart';
// import 'package:evently/ui/Authentication/log_in.dart';
// import 'package:evently/ui/Authentication/sign_up.dart';
// import 'package:evently/ui/home_page.dart';
// import 'package:evently/ui/home_tab/add_event.dart';
// import 'package:evently/ui/home_tab/home_tab.dart';
// import 'package:evently/ui/profile_tab/profile_tab.dart';
// import 'package:evently/utils/app_theme.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
import 'ui/Authentication/log_in.dart';
import 'ui/Authentication/sign_up.dart';
import 'ui/home_page.dart';
import 'ui/home_tab/add_event.dart';

import 'ui/home_tab/home_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../providers/event_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
 
 await FirebaseFirestore.instance.enableNetwork() ;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => eventProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var language_provider = Provider.of<LanguageProvider>(context) ;
    var theme_provider = Provider.of<ThemeProvider>(context) ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:   Locale(language_provider.current_language),
      initialRoute:  HomeTab.routeName, 
      theme: theme_provider.current_theme,
      routes: 
      {
        HomeTab.routeName: (context) =>  HomePage(),
       AddEvent.routeName: (context) =>  AddEvent(),
       LogIn.routeName: (context) =>  LogIn(),
       SignUp.routeName: (context) =>  SignUp(),
      },
    );
  }
}

 