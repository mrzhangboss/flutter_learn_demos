import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              size: 32,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          child: Text(
            "home",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
