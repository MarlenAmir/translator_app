import 'package:hive/hive.dart';

class HiveManager {
  final Box<Map<dynamic, dynamic>> favoriteTranslations;

  HiveManager(this.favoriteTranslations);

  // Метод для добавления элемента в базу данных
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await favoriteTranslations.add(newItem);
    _refreshItems();
  }

  // Приватный метод для обновления списка элементов с определенными полями
  List<Map<String, dynamic>> _refreshItems() {
    final data = favoriteTranslations.keys.map((key) {
      final item = favoriteTranslations.get(key);
      return {
        "key": key,
        "inputText": item?["inputText"],
        "translatedText": item?["translatedText"]
      };
    }).toList();
    return data;
  }
}
