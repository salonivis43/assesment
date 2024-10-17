// lib/screens/stories_screen.dart
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widget/story.dart';

class StoriesScreen extends StatelessWidget {
  final UserModel user;

  const StoriesScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.userName}\'s Stories'),
      ),
      body: ListView(
        children: user.stories.map<Widget>((story) {
          return Story(story: story);
        }).toList(),
      ),
    );
  }
}
