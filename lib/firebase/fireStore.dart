import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/event_model.dart';

class Firestore {

  static CollectionReference<Event> getEventCollection(){
        return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapashot,options)=> Event.fromFirestore(snapashot.data()!),
     toFirestore: (event,options)=> event.toFirestore(),
     ) ;
  }
  static Future<void> AddEventtoFireStore(Event event){
   var evntsCollection = getEventCollection() ;
   DocumentReference<Event> docRef = evntsCollection.doc() ;
   event.id = docRef.id ;
    return docRef.set(event) ;
  }


 static Future<void> updateEvent(Event event)async {
    getEventCollection().doc(event.id).update(
        {'title' : event.title ,
          'description' : event.description ,
          'dateTime' : Timestamp.fromDate(event.dateTime),

          'time' : event.time}
    ) ;
  }
}