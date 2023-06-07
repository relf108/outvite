import 'package:flutter/material.dart';
import 'package:outvite/const/standard_theming.dart';
import 'package:outvite/object/event.dart';
import 'package:outvite/object/user.dart';

class EventFeed extends StatefulWidget {
  final String endpoint;
  final bool isInvite;
  const EventFeed({super.key, required this.endpoint, this.isInvite = false});

  @override
  EventFeedState createState() => EventFeedState();
}

class EventFeedState extends State<EventFeed> {
  late String endpoint = widget.endpoint;
  late bool isInvite = widget.isInvite;
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
                  ? StandardMargins.columnItemMargin(context)
                  : EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  color: Theme.of(context).cardColor,
                  child: Column(
                    children: [event.render(context, isInvite: isInvite)],
                  )))
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    var events = [
      Event(
          name: endpoint,
          host: User(
            email: 'tristan.sutton@gmail.com',
            firstName: 'Tristan',
            lastName: 'Sutton',
            dateOfBirth: DateTime(2001, 02, 12),
          ),
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
