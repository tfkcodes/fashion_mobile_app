import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/logo/logo.png'),
            // ),
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
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }
}
