import 'package:flutter/material.dart';

BottomNavigationBar navbar() {
  return BottomNavigationBar(items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_grocery_store),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.store),
      label: 'Store',
    ),
  ]);
}

AppBar appbar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            print("hi");
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            print("searching");
          },
          icon: const Icon(
            Icons.person,
            size: 30,
          ),
        ),
      ),
    ],

    title: const Text(
      "Reciepe Book",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),

    // centerTitle: true,
    // backgroundColor: const Color.fromARGB(255, 118, 231, 122),
  );
}
