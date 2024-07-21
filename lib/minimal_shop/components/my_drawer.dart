import 'package:flutter/material.dart';
import 'package:learn_demos/minimal_shop/theme/theme_provoider.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';
import 'my_custom_drawer_header.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // head

          Column(
            children: [
              MyDrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  title: Text(
                    "Cart",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/shop");
                  }),
              ListTile(
                leading: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                onTap: exitApp),
          ),

          // shop
        ],
      ),
    );
  }
}
