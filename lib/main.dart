import 'package:flutter/material.dart';

void main() {
  runApp(weather());
}

class weather extends StatelessWidget {
  const weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
    );
  }
}
