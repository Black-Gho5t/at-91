// Clase de Modelo (Data Class)
class ItemModel {
  final int id;
  final String title;
  final String imageUrl;

  ItemModel({required this.id, required this.title, required this.imageUrl});

  // Función o "Factory constructor" para crear el modelo desde un Map/JSON
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
