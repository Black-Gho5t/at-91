## Plan de Migración a Firestore

### Contexto Actual
La app tiene un sistema de posts con:
- ✅ Paginación implementada (10 posts por página)
- ✅ Lazy loading (carga automática al scroll)
- ✅ Optimizaciones de rendering (`RepaintBoundary`, `const` widgets)

**Problema**: Con muchos posts locales, el rendimiento decaerá porque toda la lista está en RAM.

**Solución**: Migrar a Firestore para:
- Almacenar posts en la nube (sin límite de memoria local)
- Paginación nativa de Firestore
- Sincronización en tiempo real
- Mejor rendimiento y escalabilidad

---

## Pasos de Migración

### 1. **Instalar dependencias**
```bash
flutter pub add cloud_firestore firebase_storage
flutter pub get
```

### 2. **Crear servicio Firestore** (`lib/services/firestore_post_service.dart`)
Reemplaza `post_service.dart` con:
- Métodos idénticos: `getPosts()`, `createPost()`, `getTotalPostCount()`
- Usa Firestore en lugar de lista local
- Mantiene compatibilidad con código existente

### 3. **Configurar Firestore en Firebase Console**
- Crear colección `posts` en Firestore
- Configurar reglas de seguridad:
  ```
  match /posts/{document=**} {
    allow read: if request.auth != null;
    allow create: if request.auth != null;
    allow update, delete: if request.auth.uid == resource.data.userId;
  }
  ```

### 4. **Cambio mínimo en código**
En `homeScreen.dart` y `postScreen.dart`, solo cambiar:
```dart
// De:
import '../services/post_service.dart';

// A:
import '../services/firestore_post_service.dart';
// (o usar alias: import as PostService)
```

### 5. **Modelo actualizado para Firestore**
El `PostModel` necesita un campo `userId`:
```dart
class PostModel {
  final String id;        // Document ID de Firestore
  final String userId;    // UID del usuario
  final String userName;
  final String avatarUrl;
  final DateTime createdAt; // Timestamp de Firestore
  final String content;
  final int likes;
  final int comments;
  final int shares;
  
  // ... constructor y copyWith
}
```

---

## Ventajas de esta Arquitectura

| Aspecto | Local | Firestore |
|--------|-------|-----------|
| **Escalabilidad** | Limitada a RAM | Ilimitada |
| **Paginación** | Manual | Nativa |
| **Sincronización** | Manual | Automática |
| **Rendimiento** | Degrada con +100 posts | Constante |
| **Offline** | No | Sí (con Firestore offline) |

---

## Cambios Esperados en HomeScreen
```dart
// Antes (Local):
final posts = await PostService.getPosts(page: 1, pageSize: 10);

// Después (Firestore):
final posts = await FirestorePostService.getPosts(page: 1, pageSize: 10);
// Exactamente igual - cambio transparente
```

---

## Validación
Una vez migrado a Firestore:
1. Ejecutar `flutter run` y probar creación de posts
2. Verificar que aparecen en Firestore Console
3. Abrir app en otro dispositivo/navegador para ver sincronización

---

## Próximas Optimizaciones (Post-Firestore)
- [ ] Caché local con `cloud_firestore` offline mode
- [ ] Búsqueda con Algolia o Firebase Search
- [ ] Feed personalizado con algoritmo de ranking
- [ ] Notificaciones en tiempo real con FCM
