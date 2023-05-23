// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/widget/ListTileNote.dart';

class CustomSlidable extends StatelessWidget {
  CustomSlidable({super.key, required this.index});
  late int index;
  final box = Hive.box('notes');
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 8,
            onPressed: (context) {
              Navigator.of(context).pushNamed(
                'editView',
                arguments: index,
              );
            },
            backgroundColor: Colors.grey,
            icon: Icons.edit,
            label: 'Edit Note',
            borderRadius: BorderRadius.circular(36),
            foregroundColor: Colors.white,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            spacing: 8,
            onPressed: (context) {
              final box = Hive.box('notes');
              box.deleteAt(index);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete_forever_rounded,
            label: 'Delete \nNote',
            borderRadius: BorderRadius.circular(36),
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.greenAccent,
            icon: Icons.favorite_border_outlined,
            label: 'Favourite',
            borderRadius: BorderRadius.circular(36),
            foregroundColor: Colors.white,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'editView' , arguments: index);
        },
        child: ListTileNotes(k: index),
      ),
    );
  }
}
