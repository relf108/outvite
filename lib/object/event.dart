import 'package:outvite/object/abstract/attendee.dart';
import 'package:flutter/material.dart';
import 'package:outvite/object/user.dart';

class Event {
  User? host;
  String name;
  String location;
  DateTime startTime;
  DateTime? endTime;
  String? description;
  List<Attendee>? attendees;

  Event(
      {required this.host,
      required this.name,
      required this.location,
      required this.startTime,
      this.endTime,
      this.description,
      this.attendees});

  Event.fromJson(Map<String, dynamic> json)
      : host = json['host'],
        name = json['name'],
        description = json['description'],
        location = json['location'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        attendees = json['attendees'];

  Map<String, dynamic> toJson() => {
        'host': host,
        'name': name,
        'description': description,
        'location': location,
        'startTime': startTime,
        'endTime': endTime,
        'attendees': attendees
      };

  Widget render(context) {
    return Column(
      children: [
        Text(name, style: const TextStyle(fontSize: 20)),
        Text("${host?.firstName} ${host?.lastName}", style: const TextStyle(),),
        Text(location),
        Text(startTime.toString()),
        Text(endTime.toString()),
        Text(description ?? ""),
        for (Attendee attendee in attendees!) Text(attendee.toString())
      ],
    );
  }
}
