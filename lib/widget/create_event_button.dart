import 'package:flutter/material.dart';
import 'package:outvite/view/event_creator.dart';
import '../const/standard_theming.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(
            0,
            0,
            StandardMargins.widthPercent(context, percent: 0.05),
            StandardMargins.heightPercent(context)),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(Animations.transitionSlideUp(const EventCreator()));
          },
          label: const Text(
            'Create Event',
          ),
          icon: const Icon(Icons.add),
        ));
  }
}
