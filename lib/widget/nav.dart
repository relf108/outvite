import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final List<List<dynamic>> items; // [icon, title, widget]
  const NavBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final tabsCount = items.length;
    return DefaultTabController(
      length: tabsCount,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              for (var item in items)
                Tab(
                  icon: item[0],
                  text: item[1],
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (var item in items) item[2],
          ],
        ),
      ),
    );
  }
}
