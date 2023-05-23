// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/notesModel/noteModel.dart';
import 'package:my_app/widget/customButton.dart';
import 'package:my_app/widget/customTextFormField.dart';

class AddingNotesDialog extends StatefulWidget {
  const AddingNotesDialog({super.key});

  @override
  State<AddingNotesDialog> createState() => _AddingNotesDialogState();
}

class _AddingNotesDialogState extends State<AddingNotesDialog> {
  final formKey = GlobalKey<FormState>();

  TextEditingController noteAddressController = TextEditingController();
  late String title;
  late String noteContent;
  TextEditingController noteBodyController = TextEditingController();
  void onPressedValidate() {
    final state = formKey.currentState!.validate();
    if (!state) {}
    title = noteAddressController.text;
    noteContent = noteBodyController.text;
    final myModel = NoteModel(
        title: title,
        subTitle: noteContent,
        date: DateTime.now().month.toString());
    print('${myModel.title}');
    final box = Hive.box('notes');
    box.add(myModel);
    print('Note has been added successfuly');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: AlertDialog(
            title: const Text('Adding Note'),
            actions: [
              CustomTextField(
                validator: (p0) {
                  if (p0!.isNotEmpty && p0.length >= 8) {
                    return null;
                  } else {
                    return 'This field should at least 8 chars.';
                  }
                },
                controller: noteAddressController,
                prefixIcon: Icons.title_outlined,
                hint: 'Enter note address',
                maxLines: 1,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                validator: (p0) {
                  if (p0!.isNotEmpty) {
                    return null;
                  } else {
                    return 'This field should not be empty';
                  }
                },
                controller: noteBodyController,
                prefixIcon: Icons.note_add,
                hint: 'Enter your note here',
                maxLines: 10,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onpressed: onPressedValidate,
                    text: 'Add Note',
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
