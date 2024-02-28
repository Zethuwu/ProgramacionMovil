import 'package:firebase_database/firebase_database.dart';

class Event {
  final String id;
  final String title;
  final DateTime date;

  Event({required this.id, required this.title, required this.date});

  factory Event.fromSnapshot(DataSnapshot snapshot) {
    final Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

    if (data == null || !data.containsKey('title') || !data.containsKey('date')) {
      throw   const FormatException("Missing title or date in event data");
    }

    return Event(
      id: snapshot.key!,
      title: data['title'],
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
    };
  }
}