import 'package:flutter/material.dart';
import '../models/postModel.dart';
import '../utils/colors.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Card(
        color: AppColors.cardColor,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 0, // No elevation for flat look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header del Post (Avatar, Nombre, Tiempo, Botón de seguir)
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(post.avatarUrl),
                    backgroundColor: AppColors.backgroundColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),
                        Text(
                          post.timeAgo,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: AppColors.accentColor),
                    onPressed: () {
                      debugPrint('Follow ${post.userName}');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Contenido del Post
              Text(
                post.content,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 15),
              // Acciones del Post (Likes, Comentarios, Compartir)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionItem(
                    Icons.favorite_border,
                    post.likes,
                    () => debugPrint('Like Post ${post.id}'),
                  ),
                  _buildActionItem(
                    Icons.mode_comment_outlined,
                    post.comments,
                    () => debugPrint('Comment on Post ${post.id}'),
                  ),
                  _buildActionItem(
                    Icons.share_outlined,
                    post.shares,
                    () => debugPrint('Share Post ${post.id}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildActionItem(IconData icon, int count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.iconColor),
          const SizedBox(width: 5),
          Text(
            count.toString(),
            style: const TextStyle(color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
