import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learn_demos/utils.dart';

import 'minimal_shop/main.dart';
import 'nike_shop/main.dart';
import 'todo_demo/main.dart';
import 'weather_demo/main.dart';

void clear() {
  Hive.box("config").clear();
}

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("config");

  var app = box.get("app");
  if (app == 'nike') {
    clear();
    runApp(const MyNikeShopApp());
  } else if (app == 'todo') {
    clear();
    await Hive.initFlutter();
    await Hive.openBox("myBox");
    runApp(const MyToDoApp());
  } else if (app == 'theme') {
    clear();
    runApp(const MyMinimalShopApp());
  } else if (app == 'weather') {
    clear();
    runApp(const WeatherApp());
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> startApp(String name) async {
    // 使用SystemChannels平台通道重启应用
    Hive.box("config").put('app', name);
    exitApp();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Demos"),
          ),
          body: Column(
            children: [
              // head

              Text(
                "Flutter Learning Demo",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),

              // body
              Expanded(
                  child: ListView(
                children: [
                  InkWell(
                    onTap: () => startApp('todo'),
                    child: const ListTile(
                      title: Text("ToDo Demo"),
                      subtitle: Text("A simple ToDo app"),
                      leading: Icon(Icons.checklist),
                    ),
                  ),
                  InkWell(
                    onTap: () => startApp('nike'),
                    child: const ListTile(
                      title: Text("Nike Shoe Shop Demo"),
                      subtitle: Text("A simple shop app"),
                      leading: Icon(Icons.shop),
                    ),
                  ),
                  InkWell(
                    onTap: () => startApp('theme'),
                    child: const ListTile(
                      title: Text("Mini them Demo"),
                      subtitle: Text("A simple theme app"),
                      leading: Icon(Icons.dark_mode),
                    ),
                  ),
                  InkWell(
                    onTap: () => startApp('weather'),
                    child: const ListTile(
                      title: Text("Mini weather app Demo"),
                      subtitle: Text("A simple weather app"),
                      leading: Icon(Icons.sunny),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
