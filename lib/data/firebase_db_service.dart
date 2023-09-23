import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  final DatabaseReference _database;
  static FirebaseDatabaseService? _instance;

  factory FirebaseDatabaseService(String childPath) {
    _instance ??= FirebaseDatabaseService._(childPath);
    return _instance!;
  }

  FirebaseDatabaseService._(String childPath)
      : _database = FirebaseDatabase.instance.ref().child(childPath);

  Future<void> addData(Map<String, dynamic> data) async {
    await _database.push().set(data);
  }

  // Veriyi güncelleme
  Future<void> updateData(String key, Map<String, dynamic> data) async {
    await _database.child(key).update(data);
  }

  // Veriyi silme
  Future<void> deleteData(String key) async {
    await _database.child(key).remove();
  }

  Future<Map<dynamic, dynamic>> getData() async {
    Map<dynamic, dynamic> data = {};
    await _database.once().then((DatabaseEvent event) {
      if (event.snapshot != null && event.snapshot.value != null) {
        data = event.snapshot.value as dynamic;
      } else {
        data = {};
      }
    });
    return data;//eğer veri boş gelirse Future.value() diyerek hiçbişey dönmemesini sağlayabilirsin
  }
}
