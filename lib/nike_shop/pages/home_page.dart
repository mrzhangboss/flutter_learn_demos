import 'package:flutter/material.dart';

import '../../utils.dart';
import '../components/bottom_nav_bar.dart';
import '../components/drawer_item.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [
    ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: onTabChange,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo

            // Image.asset(
            //   "asset/image/nike-logo.png",
            //   color: Colors.white,
            //
            // ),
            // Divider(
            //   color: Colors.grey[900],
            // ),

            // icons
            Column(
              children: [
                // DrawerHeader(
                //   child: Image.asset(
                //     "asset/image/nike-logo.png",
                //     color: Colors.white,
                //
                //   ),
                // ),
                Image.asset(
                  "asset/image/nike-logo.png",
                  color: Colors.white,
                ),
                MyDrawItem(
                    icon: Icons.home,
                    text: "Home",
                    onTap: () {
                      Navigator.pop(context);
                    }),
                MyDrawItem(icon: Icons.info, text: "Info", onTap: () {}),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: MyDrawItem(
                  icon: Icons.logout, text: "Logout", onTap: exitApp),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
