import 'package:flutter/material.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;
  final bool isInCart;
  final VoidCallback onToggleCart;

  const FoodCard({
    super.key,
    required this.item,
    required this.isInCart,
    required this.onToggleCart,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(.10),
                offset: const Offset(1, 3),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Card(
            elevation: 3,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      IconButton(
                        icon: Icon(
                          isInCart
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: isInCart ? Colors.red : Colors.grey[500],
                        ),
                        onPressed: onToggleCart,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          bottom: 80,
          child: Image.asset(
            item.imageUrl!,
            height: 90,
            width: 90,
          ),
        ),
      ],
    );
  }
}
