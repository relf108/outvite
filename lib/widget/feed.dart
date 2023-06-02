import 'package:flutter/material.dart';
import 'package:outvite/const/standard_theming.dart';
import 'package:outvite/object/event.dart';

class EventFeed extends StatefulWidget {
  const EventFeed({super.key});

  @override
  EventFeedState createState() => EventFeedState();
}

class EventFeedState extends State<EventFeed> {
  List<Event> events = [];

  void _addEvent(Event? newEvent) {
    setState(() {
      events.add(newEvent!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        for (Event event in events)
          Container(
              margin: (events.indexOf(event) != 0)
                  ? StandardMargins.columnMargin(context)
                  : EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  child: Column(
                children: [
                  Text(event.name),
                  Text(event.location),
                  Text(event.startTime.toString()),
                  Text(event.endTime.toString()),
                  Text(event.description ?? ""),
                  for (var attendee in event.attendees ?? [])
                    Text(attendee.toString())
                ],
              )))
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    var events = [
      Event(
          name: "Test Event",
          location: "Test Location",
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 1)),
          description: "Test Description",
          attendees: [])
    ];
    for (var event in events) {
      for (var i = 0; i < 10; i++) {
        _addEvent(event);
      }
    }
  }
}
