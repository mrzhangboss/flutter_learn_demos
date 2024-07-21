import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'nike_shop/main.dart';
import 'todo_demo/main.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("config");
  var app = box.get("app");
  if (app == null) {
    runApp(const MyApp());
  } else if (app == 'todo') {
    Hive.box("config").clear();
    await Hive.initFlutter();
    await Hive.openBox("myBox");
    runApp(const MyToDoApp());
  } else {
    Hive.box("config").clear();

    runApp(const MyNikeShopApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // start new App
  Future<void> startToDo() async {
    // 使用SystemChannels平台通道重启应用
    startApp('todo');
  }

  Future<void> startApp(String name) async {
    // 使用SystemChannels平台通道重启应用
    Hive.box("config").put('app', name);
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    // 启动新的 runApp
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
                  )
                ],
              ))
            ],
          )),
    );
  }
}
