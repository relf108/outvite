import 'package:flutter/material.dart';

class EventBuilder extends StatefulWidget {
  const EventBuilder({Key? key, required this.endpoint, required this.isInvite})
      : super(key: key);

  final String endpoint;
  final bool isInvite;

  @override
  EventBuilderState createState() => EventBuilderState();
}

class EventBuilderState extends State<EventBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
