import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';

class CreatNote extends StatefulWidget {
  const CreatNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;
  @override
  State<CreatNote> createState() => _CreatNoteState();
}

class _CreatNoteState extends State<CreatNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 28,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Titel",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(
                fontSize: 28,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your Story",
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }
          final notes =
              Note(body: bodyController.text, title: titleController.text);
          widget.onNewNoteCreated(notes);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
