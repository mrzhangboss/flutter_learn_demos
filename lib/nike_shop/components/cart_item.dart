import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(widget.shoe.imagePath),
        ),
        title: Text(widget.shoe.name),
        subtitle: Text('\$' + widget.shoe.price),
        trailing: IconButton(
          onPressed: onCartItemRemove,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }

  // on cart item remove
  void onCartItemRemove() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }
}
