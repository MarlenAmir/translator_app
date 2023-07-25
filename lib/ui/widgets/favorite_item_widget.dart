import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  final String inputText;
  final String translatedText;

  FavoriteItemWidget({
    required this.inputText,
    required this.translatedText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(inputText),
      subtitle: Text(translatedText),
    );
  }
}