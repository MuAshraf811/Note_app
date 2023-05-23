// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ListTileNotes extends StatelessWidget {
  ListTileNotes({super.key, required this.k});
  late int k;

  final box = Hive.box('notes');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(32),
      ),
      child: ListTile(
        
        title: Text(
          '${box.getAt(k).title}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            '${box.getAt(k).subTitle}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        trailing: Text(
          '${box.getAt(k).date} / ${DateTime.now().day} / ${DateTime.now().year} \n ${DateTime.now().hour} : ${DateTime.now().minute}',
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
