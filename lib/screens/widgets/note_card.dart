import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.notes,
      required this.index,
      required this.onNoteDeleted});
  final Note notes;
  final int index;
  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (contxt) => NoteView(
                  notes: notes,
                  index: index,
                  onNoteDeleted: (int index) {},
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notes.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              notes.body,
              style: const TextStyle(
                fontSize: 20,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
