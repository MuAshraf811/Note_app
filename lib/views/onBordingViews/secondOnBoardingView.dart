// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int time = 2;

  @override
  void initState() {
    Future.delayed(Duration(
      seconds: time,
    )).then((value) {
      Navigator.pushNamed(context, 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.teal.withOpacity(0.8),
        title: const Text('Note App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Container(
              width: 280,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                'images/note.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Welcome and Hello   ',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'You will have a good experiance  ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
