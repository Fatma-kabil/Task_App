import 'package:flutter/material.dart';
import 'package:task_app/features/cart/presentation/pages/widgets/cart_page_footer.dart';
import 'package:task_app/features/cart/presentation/pages/widgets/food_list_view_item.dart';
import 'package:task_app/features/home/data/models/food_item_model.dart';

class CartPageBody extends StatefulWidget {
  const CartPageBody({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });

  final List<FoodItem> cartItems;
  final double totalPrice;

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {
  late List<FoodItem> _localCartItems;

  @override
  void initState() {
    super.initState();
    _localCartItems = List.from(widget.cartItems);
  }

  void removeItem(FoodItem item) {
    setState(() {
      _localCartItems.remove(item);
    });
  }

  double get total => _localCartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _localCartItems.isEmpty
              ? const Center(child: Text("Cart is empty"))
              : ListView.builder(
                  itemCount: _localCartItems.length,
                  itemBuilder: (context, index) => FoodListViewItem(
                    item: _localCartItems[index],
                    onDelete: () => removeItem(_localCartItems[index]),
                  ),
                ),
        ),
        CartPageFooter(totalPrice: total),
      ],
    );
  }
}
