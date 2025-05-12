// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import '../firebase/fireStore.dart';
// import '../models/event_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../firebase/fireStore.dart';
import '../models/event_model.dart';

class eventProvider extends ChangeNotifier {
  List<Event> events = [] ;
  List<Event> filterdEvents = [] ;
  List<Event> favoriteEvents = [] ;
  int selectedIndex = 0 ;
  List<String> tabs = [] ;
  getTabs(BuildContext context){
    tabs = [
      AppLocalizations.of(context)!.all  , AppLocalizations.of(context)!.sport, AppLocalizations.of(context)!.birthday, AppLocalizations.of(context)!.meeting,AppLocalizations.of(context)!.gaming, AppLocalizations.of(context)!.eating, AppLocalizations.of(context)!.holiday, AppLocalizations.of(context)!.exhibition, AppLocalizations.of(context)!.work_shop , AppLocalizations.of(context)!.book_club
    ] ;
  }
  void gitAllEvents() async{
    QuerySnapshot<Event> querySnapshot = await Firestore.getEventCollection().orderBy('dateTime' , descending: false).get() ;
    events = querySnapshot.docs.map(
            (doc){
          return doc.data() ;
        }
    ).toList() ;
    filterdEvents = events ;
    notifyListeners() ;
  }
  void getFilterdEvents() async{

    QuerySnapshot<Event> querySnapshot = await Firestore.getEventCollection().
        where('eventName', isEqualTo: tabs[selectedIndex]).
    orderBy('dateTime' , descending: false).get() ;
    filterdEvents = querySnapshot.docs.map(
            (doc){
          return doc.data() ;
        }
    ).toList() ;
     notifyListeners() ;
  }
  void gitFavoriteEvents() async{
    QuerySnapshot<Event> querySnapshot = await Firestore.getEventCollection().
    orderBy('dateTime' , descending: false).where('isFavorite' , isEqualTo: true)
        .get() ;
    favoriteEvents = querySnapshot.docs.map(
            (doc){
          return doc.data() ;
        }
    ).toList() ;

    notifyListeners() ;
  }

  void updateFavorite(Event event) async {
    await Firestore.getEventCollection().doc(event.id).update({
      'isFavorite': !event.isFavorite,
    });

    selectedIndex == 0 ? gitAllEvents() : getFilterdEvents();
    gitFavoriteEvents();
  }



  void changeSelectedIndex(int newIndex){
    selectedIndex = newIndex ;
    selectedIndex == 0 ? gitAllEvents() : getFilterdEvents() ;

    notifyListeners() ;
   }

   void deleteEvent(Event event){

     Firestore.getEventCollection().doc(event.id).delete();
     selectedIndex == 0 ? gitAllEvents() : getFilterdEvents() ;
     notifyListeners() ;
   }
}