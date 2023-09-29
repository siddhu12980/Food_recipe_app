// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reciepe Book",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 118, 231, 122),
      ),
      body: const Center(
        child: Column(
          children: [
            //  TextField()
          ],
        ),
      ),
    );
  }
}
