import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/models/Note.dart';
import 'package:notes/services/note_api.dart';

class NotesProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note>? _notes = [];
  List<Note>? get notes => _notes;

  NotesProvider() {
    getAll();
  }

  getAll() async {
    final tnotes = await ApiService.getAll();
    _notes = tnotes;
    isLoading = false;
    sortNote();

    notifyListeners();
  }

  getBy() async {
    final tnotes = await ApiService.getBy("qcind2909");
    _notes = tnotes;
    isLoading = false;
    sortNote();
    notifyListeners();
  }

  sortNote() {
    notes!.sort((a, b) => b.dateadded!.compareTo(a.dateadded!));
  }

  List<Note> getFilteredNotes(String searchQuery) {
    return notes!
        .where((element) =>
            element.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            element.content!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  addNote(Note note) {
    notes?.add(note);
    sortNote();
    notifyListeners();
    ApiService.addNote(note);
    print("Add completed");
  }

  deleteNote(Note note) {
    int indexofNote =
        notes!.indexOf(notes!.firstWhere((element) => element.id == note.id));
    notes!.removeAt(indexofNote);
    sortNote();

    notifyListeners();
    ApiService.deleteNote(note);
  }

  updateNote(Note note) {
    int indexofNote =
        notes!.indexOf(notes!.firstWhere((element) => element.id == note.id));
    notes![indexofNote] = note;
    sortNote();

    notifyListeners();
    ApiService.addNote(note);
  }
}
