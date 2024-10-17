// lib/models/story.dart
class StoryModel {
  final int storyId;
  final String mediaUrl;
  final String mediaType;
  final String timestamp;
  final String text;
  final String textDescription;

  StoryModel({
    required this.storyId,
    required this.mediaUrl,
    required this.mediaType,
    required this.timestamp,
    required this.text,
    required this.textDescription,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      storyId: json['story_id'],
      mediaUrl: json['media_url'],
      mediaType: json['media_type'],
      timestamp: json['timestamp'],
      text: json['text'],
      textDescription: json['text_description'],
    );
  }
}
