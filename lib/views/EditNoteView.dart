// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/notesModel/noteModel.dart';
import 'package:my_app/widget/customButton.dart';
import 'package:my_app/widget/customTextFormField.dart';

class EditNoteView extends StatelessWidget {
  EditNoteView({
    super.key,
  });

  final TextEditingController titleEditController = TextEditingController();
  final TextEditingController noteEditController = TextEditingController();
  final box = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: Colors.teal,
        title: const Text('Edit Note page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              CustomTextField(
                prefixIcon: Icons.title,
                hint: 'Edit your Note title',
                validator: (p0) {
                  return null;
                },
                controller: titleEditController,
                maxLines: 1,
              ),
              const SizedBox(
                height: 48,
              ),
              CustomTextField(
                prefixIcon: Icons.title,
                hint: 'Edit your note',
                validator: (p0) {
                  return null;
                },
                controller: noteEditController,
                maxLines: 4,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                text: 'Edit Note',
                icon: Icons.edit,
                onpressed: () {
                  final noteModel = NoteModel(
                    title: titleEditController.text,
                    subTitle: noteEditController.text,
                  );
                  box.putAt(
                    ModalRoute.of(context)!.settings.arguments as int,
                    noteModel,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
