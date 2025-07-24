import 'package:flutter/material.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/features/cart/presentation/pages/widgets/cart_page_body.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cartItems});
  final List<FoodItem> cartItems;

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + item.price);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text(
          'Your Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondryColor, kTertiaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: CartPageBody(cartItems: cartItems, totalPrice: total,),
    );
  }
}
