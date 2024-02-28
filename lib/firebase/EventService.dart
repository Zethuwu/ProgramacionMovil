import 'package:firebase_database/firebase_database.dart';
import 'Event.dart';

class EventService {
  final DatabaseReference _eventsRef = FirebaseDatabase.instance.ref().child('events');

  // Guardar un evento en Firebase
  Future<void> saveEvent(Event event) async {
    await _eventsRef.push().set(event.toJson());
  }

  // Obtener todos los eventos de Firebase
  Future<List<Event>> getEvents() async {
    DataSnapshot snapshot = (await _eventsRef.once()) as DataSnapshot;
    List<Event> events = [];

    if (snapshot.value is Map<dynamic, dynamic>) {
      (snapshot.value as Map<dynamic, dynamic>).forEach((key, value) {
        events.add(Event.fromSnapshot(snapshot));
      });
    }

    return events;
  }
}
