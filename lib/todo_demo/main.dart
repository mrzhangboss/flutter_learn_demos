import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("myBox");
  runApp(const MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.yellow[200],
          primarySwatch: Colors.yellow,
          primaryColor: Colors.yellow,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.yellow,
            onPrimary: Colors.black,
            secondary: Colors.yellow,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.yellow,
            onBackground: Colors.black,
            surface: Colors.yellow,
            onSurface: Colors.black,
          )),
      home: const HomePage(),
    );
  }
}
