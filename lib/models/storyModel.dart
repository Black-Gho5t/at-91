class StoryModel {
  final int id;
  final String userName;
  final String avatarUrl;
  final bool isMyStory; // Para diferenciar "Your Story"

  StoryModel({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    this.isMyStory = false,
  });
}
