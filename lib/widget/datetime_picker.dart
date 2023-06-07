import 'package:flutter/material.dart';
import 'package:outvite/const/standard_theming.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.onChange,
    this.restorationId,
    this.title = 'Open Picker',
    this.timePicker = false,
  });

  final Function onChange;
  final String? restorationId;
  final String title;
  final bool timePicker;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerState extends State<DatePicker> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(dynamic newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        widget.onChange(newSelectedDate);
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
            _restorableDatePickerRouteFuture.present();
          },
          child: Center(child: Text(widget.title)),
        ),
      ),
    );
  }
}
