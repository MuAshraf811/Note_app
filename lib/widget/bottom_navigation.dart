import 'package:flutter/material.dart';

class BottomNavigationBarLook extends StatelessWidget {
  const BottomNavigationBarLook({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.teal,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home_filled,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
