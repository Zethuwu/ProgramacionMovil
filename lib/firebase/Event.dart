import 'package:firebase_database/firebase_database.dart';

class Event {
  final String id;
  final String title;
  final DateTime date;

  Event({required this.id, required this.title, required this.date});

  factory Event.fromSnapshot(String id, Map<dynamic, dynamic> data) {
    if (!data.containsKey('title') || !data.containsKey('date')) {
      throw FormatException("Missing title or date in event data");
    }

    return Event(
      id: id,
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