import 'package:flutter/material.dart';
 

class LanguageProvider extends ChangeNotifier {
  
  String current_language = "en" ;

  void change_language(String language){
    current_language = language ;
    notifyListeners() ;
  }

}