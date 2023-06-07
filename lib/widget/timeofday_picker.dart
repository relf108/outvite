import 'package:flutter/material.dart';
import 'package:outvite/const/standard_theming.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    required this.onChange,
    this.restorationId,
    this.title = 'Open Picker',
  });

  final Function onChange;
  final String? restorationId;
  final String title;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _TimePickerState extends State<TimePicker> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableTimeOfDay _selectedTime =
      RestorableTimeOfDay(TimeOfDay.now());

  late final RestorableRouteFuture<TimeOfDay?>
      _restorableTimeOfDayPickerRouteFuture = RestorableRouteFuture<TimeOfDay?>(
    onComplete: _selectTime,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _timePickerRoute,
        arguments: _selectedTime.value.hour,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<TimeOfDay> _timePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return TimePickerDialog(
          restorationId: 'time_picker_dialog',
          initialEntryMode: TimePickerEntryMode.dial,
          initialTime: TimeOfDay.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedTime, 'selected_time');
    registerForRestoration(_restorableTimeOfDayPickerRouteFuture,
        'time_of_day_picker_route_future');
  }

  void _selectTime(TimeOfDay? newSelectedTime) {
    if (newSelectedTime != null) {
      setState(() {
        widget.onChange(newSelectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: StandardMargins.columnItemMargin(context),
      constraints: BoxConstraints(
          maxWidth: StandardMargins.widthPercent(context, percent: 0.4),
          maxHeight: StandardMargins.heightPercent(context, percent: 0.05)),
      child: Scaffold(
        body: OutlinedButton(
          style: OutlinedButton.styleFrom(
              alignment: Alignment.centerLeft,
              minimumSize: Size(
                  StandardMargins.widthPercent(context, percent: 0.4),
                  StandardMargins.heightPercent(context, percent: 0.05))),
          onPressed: () {
            _restorableTimeOfDayPickerRouteFuture.present();
          },
          child: Center(child: Text(widget.title)),
        ),
      ),
    );
  }
}
