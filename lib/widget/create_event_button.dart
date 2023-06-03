import 'package:flutter/material.dart';

import '../const/standard_theming.dart';
import 'feed.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: StandardMargins.heightPercent(context)),
        child: FilledButton.tonal(
          style: FilledButton.styleFrom(
            // backgroundColor: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.1),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EventFeed(
                      endpoint: 'TODO/hosting',
                    )));
          },
          child: Text('Create Event',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).colorScheme.primary)),
        ));
  }
}
