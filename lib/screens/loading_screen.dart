import 'package:flutter/material.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({super.key});

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[100],
        ),
        onPressed: () {},
        child: Text('Get Location'),
      ),
    );
  }
}
