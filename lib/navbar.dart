import 'package:flutter/material.dart';

Icon customIcon = const Icon(
  Icons.search,
  size: 30,
);

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
