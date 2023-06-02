import 'package:outvite/object/abstract/attendee.dart';

class Event {
  String name;
  String location;
  DateTime startTime;
  DateTime? endTime;
  String? description;
  List<Attendee>? attendees;

  Event(
      {required this.name,
      required this.location,
      required this.startTime,
      this.endTime,
      this.description,
      this.attendees});

  Event.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        location = json['location'],
        startTime = json['startTime'],
        endTime = json['endTime'],
        attendees = json['attendees'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'location': location,
        'startTime': startTime,
        'endTime': endTime,
        'attendees': attendees
      };
}
