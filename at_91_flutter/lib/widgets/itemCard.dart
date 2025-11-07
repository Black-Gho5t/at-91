import 'package:flutter/material.dart';
import '../models/itemModel.dart'; // Importa el modelo

// Widget de Tarjeta (UI Component)
class ItemCard extends StatelessWidget {
  final ItemModel item;

  const ItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.imageUrl),
          radius: 30,
        ),
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Lógica de navegación o acción
          print('Item ${item.id} Tapped!');
        },
      ),
    );
  }
}
