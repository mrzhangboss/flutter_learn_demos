import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  final List<Shoe> shoes = [
    Shoe(
        name: "Nike Air Max 2021",
        price: "200",
        description: "Nike Air Max 2021",
        imagePath: "asset/image/shoe1.png"),
    Shoe(
        name: "Nike Air Max 2021",
        price: "200",
        description: "Nike Air Max 2021",
        imagePath: "asset/image/shoe2.png"),
    Shoe(
        name: "Nike Air Max 2021",
        price: "200",
        description: "Nike Air Max 2021",
        imagePath: "asset/image/shoe1.png"),
    Shoe(
        name: "Nike Air Max 2021",
        price: "200",
        description: "Nike Air Max 2021",
        imagePath: "asset/image/shoe2.png"),
  ];

  List<Shoe> userCart = [];

  // get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoes;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }





}