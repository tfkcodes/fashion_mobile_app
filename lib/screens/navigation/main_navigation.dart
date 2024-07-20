import 'package:fashoo/constants/theme.dart';
import 'package:fashoo/providers/navigation/main_navigation_provider.dart';
import 'package:fashoo/screens/chat/chat_page.dart';
import 'package:fashoo/screens/explore/explore.dart';
import 'package:fashoo/screens/home/home_page.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  List<TabItem> items = [
    const TabItem(
      icon: Boxicons.bx_home_alt,
      title: 'Home',
    ),
    const TabItem(
      icon: Boxicons.bx_movie_play,
      title: 'Explore',
    ),
    const TabItem(
      icon: Boxicons.bx_plus,
      title: '',
    ),
    const TabItem(
      icon: Boxicons.bxs_message_alt_dots,
      title: 'Chats',
    ),
    const TabItem(
      icon: Boxicons.bxs_user_account,
      title: 'Settings',
    ),
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const ExploreScreen(),
    const Center(
      child: Text("add post"),
    ),
    ChatPage(),
    const Center(
      child: Text("Settings"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<MainNavigationProvider>(builder: (context, nav, child) {
      return Scaffold(
        body: _pages[nav.visit],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomBarCreative(
            boxShadow: [shadow],
            borderRadius: BorderRadius.circular(9),
            indexSelected: nav.visit,
            items: items,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onTap: (index) {
              setState(() {
                nav.setVisit(index);
              });
            },
            color: Theme.of(context).primaryColorDark,
            colorSelected: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    });
  }
}
