import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/intro_page.dart';
import 'page/home_page.dart';
import 'theme/light_mode.dart';
import 'theme/theme_provoider.dart';

void main() {
  runApp(const MyMinimalShopApp());
}

class MyMinimalShopApp extends StatelessWidget {
  const MyMinimalShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(), child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minimal Shop',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const IntroPage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
