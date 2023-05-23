// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/widget/bottom_navigation.dart';
import 'package:my_app/Theme/switch.dart';
import 'package:my_app/widget/floatingDialog.dart';
import 'package:my_app/widget/slidable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigationBarLook(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddingNotesDialog();
            },
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
        child: Center(
          child: SwitchThemeController(),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: Colors.teal,
        title: const Text('Note App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // CustomTextField(
            //     validator: (p0) {},
            //     controller: TextEditingController(),
            //     prefixIcon: Icons.search_rounded,
            //     hint: ' Hello, Search any note .....',
            //     maxLines: 1),
            ValueListenableBuilder(
              valueListenable: Hive.box('notes').listenable(),
              builder: (context, box, widget) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.teal,
                        thickness: 1,
                        height: 24,
                        indent: 8,
                        endIndent: 8,
                      );
                    },
                    padding: const EdgeInsets.all(12),
                    itemCount: Hive.box('notes').length,
                    itemBuilder: (context, index) {
                      return CustomSlidable(index: index);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
