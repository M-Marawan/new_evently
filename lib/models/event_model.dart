import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'events';

  String id;
  String image;
  String eventName;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFavorite;

  Event({
    this.id = '',
    required this.image,
    required this.title,
    required this.description,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
  });

  /// Create Event from Firestore Map
  Event.fromFirestore(Map<String, dynamic> data)
      : this(
    id: data['id'] ?? '',
    title: data['title'] ?? '',
    image: data['image'] ?? '',
    eventName: data['eventName'] ?? '',
    description: data['description'] ?? '',
    dateTime: (data['dateTime'] as Timestamp).toDate(), // ✅ Fix here
    time: data['time'] ?? '',
    isFavorite: data['isFavorite'] ?? false,
  );

  /// Convert Event to Firestore Map
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'image': image,
      'eventName': eventName,
      'title': title,
      'description': description,
      'dateTime': Timestamp.fromDate(dateTime), // ✅ Save as Timestamp
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
