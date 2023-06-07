import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outvite/widget/datetime_picker.dart';
import 'package:outvite/widget/timeofday_picker.dart';

import '../const/standard_theming.dart';

// Define a custom Form widget.
class EventCreator extends StatefulWidget {
  const EventCreator({super.key});

  @override
  EventCreatorState createState() {
    return EventCreatorState();
  }
}

class EventCreatorState extends State<EventCreator> {
  final _titleController = TextEditingController();
  int _titleLen = 0;

  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime _startDate = DateTime(0);
  TimeOfDay _startTime = const TimeOfDay(hour: 0, minute: 0);

  void setStartDate(DateTime? dateTime) {
    setState(() {
      _startDate = dateTime!;
    });
  }

  void setStartTime(TimeOfDay? timeOfDay) {
    setState(() {
      _startTime = timeOfDay!;
    });
  }

  DateTime _endDate = DateTime(0);
  TimeOfDay _endTime = const TimeOfDay(hour: 0, minute: 0);

  void setEndDate(DateTime? dateTime) {
    setState(() {
      _endDate = dateTime!;
    });
  }

  void setEndTime(TimeOfDay? timeOfDay) {
    setState(() {
      _endTime = timeOfDay!;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: StandardMargins.topLevelMargin(context),
            child: Column(children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Event Title',
                  hintText: 'Hint Text',
                  helperText: 'Helper Text',
                  counterText: '$_titleLen characters',
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) => {
                  setState(() {
                    _titleLen = value.length;
                  })
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DatePicker(
                    title: 'Start Date',
                    onChange: setStartDate,
                    restorationId: 'strart_date',
                  ),
                  TimePicker(
                    title: 'Start Time',
                    onChange: setStartTime,
                    restorationId: 'start_time',
                  )
                ],
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      if (_titleController.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Processing Data ${_titleController.text}')),
                        );
                      }
                    },
                    label: const Text(
                      'Create Event',
                    ),
                    icon: const Icon(Icons.add),
                  ))
            ])));
  }
}
