import 'package:curso/firebase/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../firebase/EventService.dart';
import 'package:curso/firebase/Event.dart';
import 'package:intl/intl.dart';
import 'AddEventScreen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final EventService _eventService = EventService();
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(DateTime.now().year - 1);
    _lastDay = DateTime(DateTime.now().year + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarFormat: CalendarFormat.month,
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEventScreen(),
                ),
              );
            },
            child: Text('Agregar Evento'),
          ),
          FutureBuilder<List<Event>>(
            future: _eventService.getEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(
                          DateFormat('dd/MM/yyyy').format(snapshot.data![index].date),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text('No hay eventos disponibles');
              }
            },
          ),
        ],
      ),
    );
  }
}
