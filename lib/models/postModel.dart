class PostModel {
  final int id;
  final String userName;
  final String avatarUrl;
  final String timeAgo;
  final String content;
  final int likes;
  final int comments;
  final int shares;

  PostModel({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    required this.timeAgo,
    required this.content,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}
