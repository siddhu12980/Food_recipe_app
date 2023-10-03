import 'package:flutter/material.dart';

// ignore: camel_case_types
class recipecard extends StatelessWidget {
  final String label;

  final String image;

  const recipecard({
    super.key,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        height: 250,
        width: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Image.network(
              image,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
