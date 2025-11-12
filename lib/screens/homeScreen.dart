import 'package:flutter/material.dart';
import '../models/postModel.dart';
import '../models/storyModel.dart';
import '../widgets/postCard.dart';
import '../widgets/storyCircle.dart';
import '../utils/colors.dart';
import '../services/post_service.dart';

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
    ),
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
    ),
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
    ),
  ];

  // Paginación
  late List<PostModel> _posts = [];
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMorePosts = true;
  static const int _pageSize = 10;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _loadInitialPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialPosts() async {
    final posts = await PostService.getPosts(page: 1, pageSize: _pageSize);
    setState(() {
      _posts = posts;
      _currentPage = 1;
      _hasMorePosts = posts.length == _pageSize;
    });
  }

  void _onScroll() {
    // Detectar cuando el usuario está cerca del final de la lista
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      if (!_isLoadingMore && _hasMorePosts) {
        _loadMorePosts();
      }
    }
  }

  Future<void> _loadMorePosts() async {
    if (_isLoadingMore) return;

    setState(() => _isLoadingMore = true);

    try {
      final newPosts = await PostService.getPosts(
        page: _currentPage + 1,
        pageSize: _pageSize,
      );

      setState(() {
        if (newPosts.isEmpty) {
          _hasMorePosts = false;
        } else {
          _posts.addAll(newPosts);
          _currentPage++;
        }
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() => _isLoadingMore = false);
      debugPrint('Error loading more posts: $e');
    }
  }

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
            child:
                _posts.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      controller: _scrollController,
                      itemCount: _posts.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        // Mostrar indicador de carga al final
                        if (index == _posts.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
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
