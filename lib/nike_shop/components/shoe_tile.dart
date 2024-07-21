import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;

  const ShoeTile({super.key, required this.shoe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 25),
        width: 400,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // shoe pic
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shoe.imagePath,
                fit: BoxFit.cover,
                width: 400,
              ),
            ),
            // description

            Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[600]),
            ),

            // price and detail

            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // shoe name
                      Text(
                        shoe.name,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // prize

                      Text(
                        '\$' + shoe.price,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  // plus button
                  InkWell(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )

            // button and add to cart
          ],
        ));
  }
}
