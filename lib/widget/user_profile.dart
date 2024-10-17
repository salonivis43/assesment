// lib/widgets/user_profile.dart
import 'package:flutter/material.dart';

import '../models/story.dart';
import '../models/user.dart';
import '../screens/story_screens.dart';
import 'story.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;

  const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the StoriesScreen when the profile is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoriesScreen(user: user),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.profilePicture),
              ),
              SizedBox(height: 10),
              Text(
                user.userName,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Displaying the stories count or a brief indication of stories
              Text(
                '${user.stories.length} stories',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
