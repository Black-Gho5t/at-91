import 'package:at_91_f/models/postModel.dart';

/// Servicio de posts con soporte para paginación.
/// Actualmente local, pero diseñado para ser reutilizable cuando se implemente Firestore.
class PostService {
  // Base de datos local simulada
  static final List<PostModel> _localPosts = [
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
      avatarUrl: 'https://i.pravatar.cc/150?img=69',
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

  static int _nextId = 4;

  /// Obtener posts con paginación
  /// [page]: número de página (comienza en 1)
  /// [pageSize]: cantidad de posts por página (default: 10)
  static Future<List<PostModel>> getPosts({
    int page = 1,
    int pageSize = 10,
  }) async {
    // Validar parámetros
    if (page < 1) page = 1;
    if (pageSize < 1) pageSize = 10;

    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 300));

    final startIndex = (page - 1) * pageSize;
    final endIndex = startIndex + pageSize;

    // Asegurar que los índices están dentro del rango
    if (startIndex >= _localPosts.length) {
      return [];
    }

    return _localPosts.sublist(
      startIndex,
      endIndex > _localPosts.length ? _localPosts.length : endIndex,
    );
  }

  /// Obtener todos los posts (para compatibilidad con código anterior)
  static Future<List<PostModel>> getAllPosts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_localPosts);
  }

  /// Crear un nuevo post
  static Future<PostModel> createPost({
    required String userName,
    required String avatarUrl,
    required String content,
  }) async {
    // Validar límite de caracteres
    if (content.isEmpty) {
      throw Exception('El contenido no puede estar vacío');
    }
    if (content.length > 300) {
      throw Exception('El contenido no puede exceder 300 caracteres');
    }

    // Simular delay de red/BD
    await Future.delayed(const Duration(milliseconds: 500));

    final newPost = PostModel(
      id: _nextId++,
      userName: userName,
      avatarUrl: avatarUrl,
      timeAgo: 'ahora',
      content: content,
      likes: 0,
      comments: 0,
      shares: 0,
    );

    // Agregar a la lista local
    _localPosts.insert(0, newPost);

    return newPost;
  }

  /// Obtener total de posts
  static Future<int> getTotalPostCount() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _localPosts.length;
  }
}
