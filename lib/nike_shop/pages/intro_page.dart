import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(42),
                child: Image.asset(
                  'asset/image/nike-logo.png',
                  height: 240,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 48),
              // text
              const Text('Just Do It',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              // subtitle
              const SizedBox(height: 24),

              const Text(
                'Brand your own style and fit your quests with high quiality shoes and up to your data do ',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // button

              GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }))
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
