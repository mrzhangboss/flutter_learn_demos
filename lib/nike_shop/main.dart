import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyNikeShopApp());
}

class MyNikeShopApp extends StatelessWidget {
  const MyNikeShopApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nike Shoes',
        home: IntroPage(),
      ),
    );
  }
}
