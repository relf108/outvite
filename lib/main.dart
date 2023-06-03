import 'package:flutter/material.dart';
import 'package:outvite/widget/create_event_button.dart';
import 'package:outvite/widget/feed.dart';
import 'package:outvite/widget/nav.dart';

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
        theme: ThemeData(
            colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
        home: const NavBar(items: [
          [
            Icon(Icons.cloud_outlined),
            'Attending',
            Center(
                child: Row(
              children: [
                EventFeed(
                  endpoint: 'TODO/attending',
                )
              ],
            ))
          ],
          [
            Icon(Icons.mail_outline_outlined),
            'Invites',
            Center(
                child: Row(children: [
              EventFeed(endpoint: 'TODO/invites', isInvite: true)
            ]))
          ],
          [
            Icon(Icons.house_outlined),
            'Hosting',
            Stack(children: [
              Center(
                  child: Row(children: [
                EventFeed(
                  endpoint: 'TODO/hosting',
                ),
              ])),
              CreateEventButton()
            ]),
          ],
          [
            Icon(Icons.brightness_5_sharp),
            'Profile',
            Center(child: Text('Profile'))
          ],
        ]));
  }

  @override
  void initState() {
    super.initState();
  }
}
