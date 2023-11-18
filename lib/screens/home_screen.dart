import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "오늘의 웹툰",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
      ),
    );
  }
}
