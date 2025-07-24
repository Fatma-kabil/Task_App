import 'package:flutter/material.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';

class FoodListViewItem extends StatelessWidget {
  const FoodListViewItem({super.key, required this.item, required this.onDelete});
  final FoodItem item;
   final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item.imageUrl!,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.green[700]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.blueGrey),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
