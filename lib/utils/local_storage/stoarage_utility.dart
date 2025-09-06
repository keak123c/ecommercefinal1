import 'package:get_storage/get_storage.dart';

class EStorageUtility {
  static final EStorageUtility _instance = EStorageUtility._internal();
  
  factory EStorageUtility() {
    return _instance;
  }

  EStorageUtility._internal();

  final _storage = GetStorage();

  //Generic method to save data
  Future<void> saveData<E>(String key, E value) async {
    await _storage.write(key, value);
  }

  //Generic method to get data
  E? readData<E>(String key) {
    return _storage.read(key);
  }

  //Generic method to delete data
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  //Clear all data in storage
  Future<void> clearStorage() async {
    await _storage.erase();
  }
}