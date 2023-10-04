// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class box extends StatelessWidget {
  final String link;

  const box({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Image.asset(
          link,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
