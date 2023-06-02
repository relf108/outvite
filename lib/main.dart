import 'package:flutter/material.dart';
import 'package:outvite/widget/feed.dart';
import 'package:outvite/const/standard_theming.dart';

void main() {
  runApp(const Outvite());
}

class Outvite extends StatefulWidget {
  const Outvite({super.key});

  @override
  OutviteState createState() => OutviteState();
}

class OutviteState extends State<Outvite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: StandardMargins.edgeInsets(context),
            child: const EventFeed(),
          )
        ],
      ))),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
