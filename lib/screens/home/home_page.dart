import 'package:fashoo/component/post_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
              'Social',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem('You',
                      'https://images.unsplash.com/photo-1676121455681-01a6eeb870a7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNsZWV2ZXxlbnwwfHwwfHx8MA%3D%3D',
                      isAddStory: true),
                  _buildStoryItem('Theresa Webb',
                      'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZhY2V8ZW58MHx8MHx8fDA%3D',
                      isLive: true),
                  _buildStoryItem('Robert Fox',
                      'https://images.unsplash.com/photo-1643185539104-3622eb1f0ff6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmVhdXR5fGVufDB8fDB8fHww'),
                ],
              ),
            ),
            // Post section
            PostComponent(media: [
              PostMedia(
                  type: PostMediaType.image,
                  url:
                      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D'),
              PostMedia(
                  type: PostMediaType.image,
                  url:
                      'https://images.unsplash.com/photo-1509631179647-0177331693ae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D')
            ]),
            PostComponent(media: [
              PostMedia(
                  type: PostMediaType.image,
                  url:
                      'https://images.unsplash.com/photo-1520367745676-56196632073f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YWZyaWNhbiUyMGZhc2hpb24lMjBtZW58ZW58MHx8MHx8fDA%3D'),
              PostMedia(
                  type: PostMediaType.image,
                  url:
                      'https://images.unsplash.com/photo-1520367445093-50dc08a59d9d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YWZyaWNhbiUyMGZhc2hpb24lMjBtZW58ZW58MHx8MHx8fDA%3D')
            ])
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem(String name, String imageUrl,
      {bool isAddStory = false, bool isLive = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
              if (isAddStory)
                const Center(
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.add, size: 15, color: Colors.white),
                  ),
                ),
              if (isLive)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Live',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPostHeader(String name, String handle, String imageUrl) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              handle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.more_vert, color: Colors.black),
      ],
    );
  }
}
