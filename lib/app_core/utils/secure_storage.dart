import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  save({required String key, required dynamic value}) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic>? get({required String key}) async {
    final dynamic value = await storage.read(key: key);

    return value;
  }

  delete({required String key}) async {
    await storage.delete(key: key);
  }

  deleteAll() async {
    await storage.deleteAll();
  }
}
