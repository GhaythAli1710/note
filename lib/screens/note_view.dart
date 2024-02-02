import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {super.key,
      required this.notes,
      required this.index,
      required this.onNoteDeleted});
  final Note notes;
  final int index;
  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(" Note View"),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Do you delet this NOte?"),
                        content: Text("Note ${notes.title} Will deleted."),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(" DELETE")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onNoteDeleted(index);
                                Navigator.of(context).pop();
                              },
                              child: const Text(" CANCEL"))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.title,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                notes.body,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ));
  }
}
