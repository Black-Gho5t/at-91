import 'package:flutter/material.dart';
import '../models/postModel.dart';
import '../models/storyModel.dart';
import '../widgets/postCard.dart';
import '../widgets/storyCircle.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Datos simulados para las historias
  final List<StoryModel> _stories = [
    StoryModel(
      id: 0,
      userName: 'Your Story',
      avatarUrl: 'assets/user_avatar.png',
      isMyStory: true,
    ), // Placeholder
    StoryModel(
      id: 1,
      userName: 'Alex',
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
    ),
    StoryModel(
      id: 2,
      userName: 'Your Story',
      avatarUrl: 'assets/user_avatar.png',
      isMyStory: true,
    ), // Placeholder
    StoryModel(
      id: 3,
      userName: 'Alex',
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
    ),
    StoryModel(
      id: 4,
      userName: 'Your Story',
      avatarUrl: 'assets/user_avatar.png',
      isMyStory: true,
    ), // Placeholder
  ];

  // Datos simulados para las publicaciones
  final List<PostModel> _posts = [
    PostModel(
      id: 1,
      userName: 'AlexJohnson',
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
      timeAgo: '2h ago',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Just finished an amazing workout! Feeling great and ready to tackle the day. 💪',
      likes: 24,
      comments: 5,
      shares: 3,
    ),
    PostModel(
      id: 2,
      userName: 'yaderalvarez',
      avatarUrl: 'https://i.pravatar.cc/150?img=69', // Otro avatar
      timeAgo: '2h ago',
      content:
          'Just finished an amazing workout! Feeling great and ready to tackle the day. 💪',
      likes: 12,
      comments: 2,
      shares: 1,
    ),
    PostModel(
      id: 3,
      userName: 'AlexJohnson',
      avatarUrl: 'https://i.pravatar.cc/150?img=68',
      timeAgo: '4h ago',
      content:
          'Enjoying the beautiful sunset! What a perfect end to the day. 🌅',
      likes: 50,
      comments: 10,
      shares: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BIENVENIDO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search tapped');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              print('Notifications tapped');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Sección de Historias
          SizedBox(
            height: 100, // Altura fija para las historias
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length,
              itemBuilder: (context, index) {
                // Aquí deberías tener una imagen de placeholder para "Your Story" en assets/
                // O un widget especial para "Your Story"
                return StoryCircle(story: _stories[index]);
              },
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.cardColor,
          ), // Separador visual
          // Feed de Publicaciones
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: _posts[index]);
              },
            ),
          ),
        ],
      ),
      // NOTE: BottomNavigationBar has been moved to a shared widget / router shell.
    );
  }
}
