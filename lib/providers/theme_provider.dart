// import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData current_theme = AppTheme.lightTheme ;

  void change_theme(ThemeData theme){
    current_theme = theme  ;
    notifyListeners() ;
  }
}