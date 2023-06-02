import 'package:outvite/enum/attendee_type.dart';

abstract class Attendee {
  dynamic contact;
  AttendeeType type;

  Attendee({required this.contact, required this.type});

  @override
  String toString() {
    return '"Attendee": {name: $contact, type: $type}';
  }
}
