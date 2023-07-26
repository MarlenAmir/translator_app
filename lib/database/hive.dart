import 'package:hive/hive.dart';

import 'package:hive/hive.dart';

class HiveManager {
  final Box<Map<dynamic, dynamic>> favoriteTranslations;

  HiveManager(this.favoriteTranslations);

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await favoriteTranslations.add(newItem);
    _refreshItems();
  }

  List<Map<String, dynamic>> _refreshItems() {
    final data = favoriteTranslations.keys.map((key) {
      final item = favoriteTranslations.get(key);
      return {
        "key": key,
        "inputText": item?["inputText"],
        "translatedText": item?["translatedText"]
      };
    }).toList();
    // setState(() {}); // You don't need this setState here
    return data;
  }
}
