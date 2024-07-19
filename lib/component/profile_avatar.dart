import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class ProfileAvatar extends StatefulWidget {
  final Color? nameColor, handleColor;
  const ProfileAvatar({
    super.key,
    this.nameColor,
    this.handleColor,
  });

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.primary),
          child: const Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1522973717924-b10fe4e185cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGNvdXBsZXN8ZW58MHx8MHx8fDA%3D'), // Replace with your profile image URL
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Brooklyn Simmons',
                  style: TextStyle(
                    color: widget.nameColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Boxicons.bxs_badge_check,
                    color: Theme.of(context).colorScheme.primary, size: 23),
              ],
            ),
            Text(
              '@brooklyns',
              style: TextStyle(
                color: widget.handleColor ?? Color(0xFFE0E0E0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(width: 5),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Follow',
            style: TextStyle(color: Color(0xffffffff)),
          ),
        ),
      ],
    );
  }
}
