
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/favorite_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранные переводы'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('favorite_translations').listenable(),
        builder: (context, Box box, _) {
          final List<Map<String, dynamic>> _items = [];
          for (var key in box.keys) {
            final item = box.get(key);
            _items.add({
              "key": key,
              "inputText": item["inputText"],
              "translatedText": item["translatedText"]
            });
          }

          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return FavoriteItemWidget(
                inputText: item["inputText"],
                translatedText: item["translatedText"],
              );
            },
          );
        },
      ),
    );
  }
}
