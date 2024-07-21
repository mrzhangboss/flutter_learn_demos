import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: [
                // logo
                Icon(
                  Icons.shopping_bag,
                  size: 200,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                // title
                const SizedBox(height: 16),
                Text("Minimal Shop",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                // subtitle
                const SizedBox(height: 16),

                Text("Premium Quality Products",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    )),

                //button
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/home"),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 50,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
