

import 'package:my_pro/models/story.dart';

class UserModel {
  final int userId;
  final String userName;
  final String profilePicture;
  final List<StoryModel> stories;

  UserModel({
    required this.userId,
    required this.userName,
    required this.profilePicture,
    required this.stories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var list = json['stories'] as List;
    List<StoryModel> storiesList = list.map((i) => StoryModel.fromJson(i)).toList();

    return UserModel(
      userId: json['user_id'],
      userName: json['user_name'],
      profilePicture: json['profile_picture'],
      stories: storiesList,
    );
  }
}
