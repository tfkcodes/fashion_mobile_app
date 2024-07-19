import 'package:fashoo/component/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import '../../component/social_action_btn.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1696451202957-f2b0c19a8958?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNsZWV2ZXxlbnwwfHwwfHx8MA%3D%3D'), // Replace with your video or image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Short videos',
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.bold),
                    ),
                    // const Icon(Icons.more_vert, color: Colors.white),
                    socialActionBtn(icon: Icons.more_vert)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      socialActionBtn(
                        icon: Boxicons.bxs_heart,
                        count: "45K",
                        iconColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      socialActionBtn(
                          icon: Boxicons.bx_comment, count: "9.04K"),
                      const SizedBox(
                        height: 25,
                      ),
                      socialActionBtn(icon: Boxicons.bxl_telegram, count: "5K"),
                      const SizedBox(
                        height: 25,
                      ),
                      socialActionBtn(
                          icon: Boxicons.bx_bookmark, count: "Save"),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileAvatar(),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut.',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    // Song name
                    Text(
                      '🎵 Aria Nova - Electric Dreamscape',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFF2E2D2D).withOpacity(0.7)),
              child: Icon(
                Icons.play_circle_fill,
                color: Theme.of(context).primaryColorLight,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
