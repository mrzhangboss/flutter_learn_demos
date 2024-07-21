import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_demos/nike_shop/models/cart.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, provider, child) {
        return Container(
          child: Column(
            children: [
              // search
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Search"),
                      Icon(Icons.search),
                    ],
                  )),

              // text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "everyone file... some fly loner than other",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              // hot picks

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Picks🔥",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              // shoes
              const SizedBox(
                height: 50,
              ),

              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.getShoeList().length,
                      itemBuilder: (context, index) {
                        var shoe = provider.getShoeList()[index];
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => onAddToCart(shoe),
                        );
                      })),

              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // on Add To Cart
  void onAddToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Successfully added to cart"),
        content: Text("Check out your cart"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    });
  }
}
