import 'package:flutter/material.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/features/cart/presentation/pages/cart_page.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';
import 'package:task_app/features/home/presentation/pages/widgets/home_page_body.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodItem> cartItems = [];

  void toggleCart(FoodItem item) {
    setState(() {
      if (cartItems.contains(item)) {
        cartItems.remove(item);
      } else {
        cartItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: const Icon(Icons.fastfood, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, kSecondryColor, kTertiaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Food',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: HomePageBody(
        cartItems: cartItems,
        onToggleCart: toggleCart,
      ),
    );
  }
}
