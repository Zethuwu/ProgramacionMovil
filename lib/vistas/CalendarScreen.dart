import 'dart:html';

import 'package:curso/firebase/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../firebase/EventService.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({ key, required this.title}) : super(key: key);

  final String title;
  //final EventService eventService;
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(DateTime.now().year - 1); // Establece el primer día del año pasado
    _lastDay = DateTime(DateTime.now().year + 1); // Establece el último día del próximo año
  }
  /*void _saveEvent(Event event) {
    widget.eventService.saveEvent(event);
  }*/

  /*Future<Future<List<Event>>> _getEvents() async {
    return widget.eventService.getEvents();
  }*/

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
            firstDay: _firstDay, // Usa el primer día que estableciste
            lastDay: _lastDay, // Usa el último día que estableciste
            focusedDay: _focusedDay,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            // Otros atributos del TableCalendar...
          ),
        ],
      ),
    );
  }
}

