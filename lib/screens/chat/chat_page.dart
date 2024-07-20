import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  String selected = "Approved";

  late TabController _tabController;

  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final List<UserProfile> stories = [
    UserProfile(
      name: 'Bernard',
      url:
          'https://images.unsplash.com/photo-1508243771214-6e95d137426b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWZyaWNhbiUyMGZhc2hpb24lMjBtZW58ZW58MHx8MHx8fDA%3D',
    ),
    UserProfile(
        name: 'Chris',
        url:
            'https://images.unsplash.com/photo-1568782517100-09bf22d88c2d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFmcmljYW4lMjBmYXNoaW9uJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D'),
    UserProfile(
        name: 'Alkhoon',
        url:
            'https://images.unsplash.com/photo-1470434767159-ac7bf1b43351?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWZyaWNhbiUyMGZhc2hpb24lMjBtZW58ZW58MHx8MHx8fDA%3D'),
    UserProfile(
        name: 'Adidas',
        url:
            'https://images.unsplash.com/photo-1531123414780-f74242c2b052?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YWZyaWNhbiUyMGZhc2hpb24lMjBnaXJsfGVufDB8fDB8fHww'),
    UserProfile(
        name: 'Lebron',
        url:
            'https://images.unsplash.com/photo-1546728150-b3cbeddb6f6d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YWZyaWNhbiUyMGZhc2hpb24lMjBnaXJsfGVufDB8fDB8fHww')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo/logo.png"),
                        fit: BoxFit.cover)),
              ),
              Text(
                'Chat',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: Column(children: [
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(stories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).colorScheme.primary),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(stories[index].url),
                          ),
                        ),
                      ),
                      Text(stories[index].name)
                    ],
                  ),
                );
              }),
            ),
          ),
          //add tabs for
          Expanded(
            child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      // Customize the appearance and behavior of the tab bar
                      backgroundColor: _selectedColor,
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: _unselectedColor,
                        fontWeight: FontWeight.bold,
                      ),
                      // Add your tabs here
                      tabs: [
                        Tab(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text("All"),
                          ),
                        ),
                        Tab(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text("Primary"),
                          ),
                        ),
                        Tab(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("General"),
                          ),
                        ),
                        Tab(
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("Requested"),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(
                            child: Text("All"),
                          ),
                          Center(
                            child: Text("Primary"),
                          ),
                          Center(
                            child: Text('General'),
                          ),
                          Center(
                            child: Text('Requested'),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ]));
  }
}

class UserProfile {
  final String name;
  final String url;
  UserProfile({required this.name, required this.url});
}
