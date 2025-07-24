import 'package:flutter/material.dart';
import 'package:task_app/core/food_item_list.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';
import 'package:task_app/features/home/presentation/pages/widgets/food_card.dart';

class HomePageBody extends StatelessWidget {
  final List<FoodItem> cartItems;
  final Function(FoodItem) onToggleCart;

  const HomePageBody({
    super.key,
    required this.cartItems,
    required this.onToggleCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 70, bottom: 40),
      child: GridView.builder(
        itemCount: foodItems.length,
          clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 70,
          crossAxisSpacing: 25,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return FoodCard(
            item: item,
            isInCart: cartItems.contains(item),
            onToggleCart: () => onToggleCart(item),
          );
        },
      ),
    );
  }
}
