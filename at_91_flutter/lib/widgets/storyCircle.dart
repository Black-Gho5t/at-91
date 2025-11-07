import 'package:flutter/material.dart';
import '../models/storyModel.dart';
import '../utils/colors.dart';

class StoryCircle extends StatelessWidget {
  final StoryModel story;

  // Constructor ahora es const
  const StoryCircle({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding es ahora const
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          print('Story ${story.userName} tapped');
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Border.all NO puede ser const si usa una propiedad dinámica (story.isMyStory)
                border: Border.all(
                  color:
                      story.isMyStory
                          ? Colors.transparent
                          : AppColors.accentColor,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.cardColor,
                // NetworkImage no puede ser const
                backgroundImage: NetworkImage(story.avatarUrl),
                child:
                    story.isMyStory
                        // const Icon()
                        ? const Icon(
                          Icons.add,
                          color: AppColors.textColor,
                          size: 30,
                        )
                        : null,
              ),
            ),
            // const SizedBox()
            const SizedBox(height: 5),
            Text(
              story.userName,
              // const TextStyle()
              style: const TextStyle(color: AppColors.textColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
