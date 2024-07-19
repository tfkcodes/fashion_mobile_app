import 'package:fashoo/component/profile_avatar.dart';
import 'package:fashoo/component/social_action_btn.dart';
import 'package:fashoo/component/story_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

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
        title: const Row(
          children: [
            Text(
              'Social',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                color: Colors.red,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileAvatar(
                    nameColor: const Color(0xff000000),
                    handleColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1676121455681-01a6eeb870a7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNsZWV2ZXxlbnwwfHwwfHx8MA%3D%3D'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Boxicons.bxs_heart,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                const Text("45.0K"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Boxicons.bx_comment_dots,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                const Text("45.0K"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Boxicons.bxl_telegram,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                const Text("4K"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Boxicons.bx_bookmark,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          const Text("save"),
                        ],
                      )
                    ],
                  ),
                  Text(
                    """To match the design shown in the new image, you'll need to adjust the story item widget to have rounded rectangle shapes instead of circles and ensure the placement of the "Live" indicator and the "+" icon for adding stories aligns with the design.""",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
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
