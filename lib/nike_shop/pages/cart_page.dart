import 'package:flutter/material.dart';
import 'package:learn_demos/nike_shop/models/cart.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // head
              Text("My Cart",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[600],
                  )),

              const SizedBox(height: 8),

              // carts
              Expanded(
                  child: ListView.builder(
                      itemCount: provider.getUserCart().length,
                      itemBuilder: (context, index) {
                        return CartItem(shoe: provider.getUserCart()[index]);
                      }))
            ],
          ),
        );
      },
    );
  }
}
