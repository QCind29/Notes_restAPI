import 'package:flutter/material.dart';
import 'package:notes/Util/Util.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/Note.dart';
import '../providers/note_provider.dart';

class Addnewnote extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const Addnewnote({Key? key, required this.isUpdate, this.note})
      : super(key: key);

  @override
  State<Addnewnote> createState() => _AddnewnoteState();
}

class _AddnewnoteState extends State<Addnewnote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  FocusNode focusNode = FocusNode();

  String Title = "Add new note page";


  addNote() async {
    Note newNote = Note(
        id: const Uuid().v1(),
        userid: "qcind2909",
        title: titleController.text,
        content: contentController.text,
        dateadded: DateTime.now());

    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  updateNote() async {
    widget.note!.title = titleController.text;
    widget.note!.content = contentController.text;
    widget.note!.dateadded = DateTime.now();    
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }
  @override
  void initState() {
    super.initState();

    if(widget.isUpdate) {
      titleController.text = widget.note!.title!;
      contentController.text = widget.note!.content!;
      Title = "Update note page";

    }
  }


  @override
  Widget build(BuildContext context) {
    bool isUpdating = widget.isUpdate;

    print(Title + "0" +isUpdating.toString());

   

    return Scaffold(
        appBar: AppBar(
          title: Text(Title),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if (widget.isUpdate) {
                  updateNote();
                } else {
                  addNote();
                }
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
                child: TextFormField(
              controller: titleController,
              autofocus: true,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            )),
            Expanded(
                child: TextFormField(
              controller: contentController,
              focusNode: focusNode,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: "Content", border: InputBorder.none),
            ))
          ]),
        )));
  }
}
