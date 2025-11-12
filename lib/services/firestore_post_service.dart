// // Necesario para debugPrint
// import 'package:flutter/foundation.dart';
// import 'package:at_91_f/models/postModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// /// Servicio de posts con Firestore.
// /// Reemplaza post_service.dart una vez implementado.
// /// Mantiene la misma interfaz para cambio transparent.
// class FirestorePostService {
//   // static final FirebaseFirestore _db = FirebaseFirestore.instance;
//   static const String _postsCollection = 'posts';

//   /// Obtener posts con paginación
//   /// [page]: número de página (comienza en 1)
//   /// [pageSize]: cantidad de posts por página
//   static Future<List<PostModel>> getPosts({
//     int page = 1,
//     int pageSize = 10,
//   }) async {
//     try {
//       // Validar parámetros
//       if (page < 1) page = 1;
//       if (pageSize < 1) pageSize = 10;

//       // final query = _db
//           .collection(_postsCollection)
//           .orderBy('createdAt', descending: true)
//           .limit(pageSize * page);

//       // final snapshot = await query.get();
//       // final docs = snapshot.docs;

//       // Paginación manual (Firestore no soporta offset bien, usar cursor después)
//       final startIndex = (page - 1) * pageSize;
//       final endIndex = page * pageSize;

//       if (startIndex >= docs.length) {
//         return [];
//       }

//       final paginatedDocs = docs.sublist(
//         startIndex,
//         endIndex > docs.length ? docs.length : endIndex,
//       );

//       return paginatedDocs.map((doc) => _postFromFirestore(doc)).toList();
//     } catch (e) {
//       debugPrint('Error getting posts: $e');
//       return [];
//     }
//   }

//   /// Obtener todos los posts (para compatibilidad)
//   static Future<List<PostModel>> getAllPosts() async {
//     try {
//       final snapshot =
//           await _db
//               .collection(_postsCollection)
//               .orderBy('createdAt', descending: true)
//               .get();

//       return snapshot.docs.map((doc) => _postFromFirestore(doc)).toList();
//     } catch (e) {
//       debugPrint('Error getting all posts: $e');
//       return [];
//     }
//   }

//   /// Crear un nuevo post
//   static Future<PostModel> createPost({
//     required String userId,
//     required String userName,
//     required String avatarUrl,
//     required String content,
//   }) async {
//     // Validar límite de caracteres
//     if (content.isEmpty) {
//       throw Exception('El contenido no puede estar vacío');
//     }
//     if (content.length > 300) {
//       throw Exception('El contenido no puede exceder 300 caracteres');
//     }

//     try {
//       final docRef = _db.collection(_postsCollection).doc();

//       final postData = {
//         'id': docRef.id,
//         'userId': userId,
//         'userName': userName,
//         'avatarUrl': avatarUrl,
//         'content': content,
//         'likes': 0,
//         'comments': 0,
//         'shares': 0,
//         'createdAt': FieldValue.serverTimestamp(),
//         'updatedAt': FieldValue.serverTimestamp(),
//       };

//       await docRef.set(postData);

//       // Retornar el post creado
//       final snapshot = await docRef.get();
//       return _postFromFirestore(snapshot);
//     } catch (e) {
//       debugPrint('Error creating post: $e');
//       rethrow;
//     }
//   }

//   /// Obtener total de posts
//   static Future<int> getTotalPostCount() async {
//     try {
//       final snapshot = await _db.collection(_postsCollection).count().get();
//       return snapshot.count ?? 0;
//     } catch (e) {
//       debugPrint('Error getting post count: $e');
//       return 0;
//     }
//   }

//   /// Convertir documento Firestore a PostModel
//   static PostModel _postFromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     final timestamp = data['createdAt'] as Timestamp?;

//     return PostModel(
//       id: doc.id,
//       userName: data['userName'] ?? 'Usuario',
//       avatarUrl: data['avatarUrl'] ?? '',
//       timeAgo: _getTimeAgo(timestamp),
//       content: data['content'] ?? '',
//       likes: data['likes'] ?? 0,
//       comments: data['comments'] ?? 0,
//       shares: data['shares'] ?? 0,
//     );
//   }

//   /// Calcular tiempo relativo desde la creación
//   static String _getTimeAgo(Timestamp? timestamp) {
//     if (timestamp == null) return 'hace poco';

//     final now = DateTime.now();
//     final postTime = timestamp.toDate();
//     final diff = now.difference(postTime);

//     if (diff.inMinutes < 1) return 'hace un momento';
//     if (diff.inMinutes < 60) return 'hace ${diff.inMinutes}m';
//     if (diff.inHours < 24) return 'hace ${diff.inHours}h';
//     if (diff.inDays < 7) return 'hace ${diff.inDays}d';
//     if (diff.inDays < 30) return 'hace ${(diff.inDays / 7).ceil()}w';

//     return 'hace ${(diff.inDays / 30).ceil()}mo';
//   }

//   /// Escuchar cambios en tiempo real (para features avanzadas)
//   static Stream<List<PostModel>> streamPosts({int pageSize = 10}) {
//     return _db
//         .collection(_postsCollection)
//         .orderBy('createdAt', descending: true)
//         .limit(pageSize)
//         .snapshots()
//         .map((snapshot) {
//           return snapshot.docs.map((doc) => _postFromFirestore(doc)).toList();
//         });
//   }
// }
