
import 'dart:ffi';

import 'package:my_todo_app/data/firebase_db_service.dart';

import '../models/note_model.dart';

class NoteRepository {
  final String _notePath = 'notes'; // Firebase veritabanı yolu
  final  _databaseService = FirebaseDatabaseService("note");

  // Veriyi ekler
  Future<void> addNote(Note note) async {
    final data = note.toMap();
    await _databaseService.addData(data);
  }

  // Veriyi günceller
  Future<void> updateNote(String key, Note note) async {
    final data = note.toMap();
    await _databaseService.updateData(key, data);
  }

  // Veriyi siler
  Future<void> deleteNote(String key) async {
    await _databaseService.deleteData(key);
  }

    Future<List<Note>> getNotes() async {
    var snapshot = await _databaseService.getData();
    var notes = <Note>[];
    snapshot.forEach((key, value) {
      final note = Note.fromMap(value,key);
      notes.add(note);
       print(note.title);
    });
   
    return notes;
  }

}
