import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:translator_app/generated/l10n.dart';

import '../widgets/favorite_item_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key});

  void _deleteItem(int key) {
    final box = Hive.box('favorite_translations');
    box.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            S.of(context).favorites,
          ),
        ),
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
                onDelete: () =>
                    _deleteItem(item["key"] as int), // Приведение типа здесь
              );
            },
          );
        },
      ),
    );
  }
}
