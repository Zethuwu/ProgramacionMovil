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
    DatabaseEvent event = await _eventsRef.once();
    DataSnapshot snapshot = event.snapshot;
    List<Event> events = [];

    if (snapshot != null && snapshot.value != null) {
      Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        data.forEach((key, value) {
          if (value != null && value is Map<dynamic, dynamic>) {
            Event event = Event(
              id: key.toString(),
              title: value['title'].toString(),
              date: DateTime.parse(value['date'].toString()),
            );
            events.add(event);
          }
        });
      }
    }

    return events;
  }

}
