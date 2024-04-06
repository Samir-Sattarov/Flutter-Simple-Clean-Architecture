import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveStorageService {
  save({required String key, required dynamic value}) async {
    final storage = await Hive.openBox('storage');

    debugPrint("Save to hive storage $key $value");
    await storage.put(key, value);
  }

  Future<dynamic>? get({required String key}) async {
    final storage = await Hive.openBox('storage');

    final response = await storage.get(key);

    return response;
  }

  delete({required String key}) async {
    final storage = await Hive.openBox('storage');

    await storage.delete(key);
  }

  deleteAll() async {
    final storage = await Hive.openBox('storage');

    await storage.deleteFromDisk();
  }
}
