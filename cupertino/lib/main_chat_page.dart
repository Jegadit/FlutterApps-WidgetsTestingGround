// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

import 'screens/chat_page.dart';
import 'screens/profile_screen.dart';

// ignore: must_be_immutable
class TheAllBox extends StatelessWidget {
  TheAllBox({Key? key}) : super(key: key);
  var screens = [const Chat(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(items: [
          const BottomNavigationBarItem(
              label: "Chats", icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
          const BottomNavigationBarItem(
              label: "Profile", icon: Icon(CupertinoIcons.profile_circled)),
        ]),
        tabBuilder: (BuildContext context, int index) {
          // ignore: avoid_unnecessary_containers
          return screens[index];
        },
      ),
    );
  }
}
