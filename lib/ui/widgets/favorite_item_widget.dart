import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  final String inputText;
  final String translatedText;
  final VoidCallback onDelete;

  const FavoriteItemWidget({super.key, 
    required this.inputText,
    required this.translatedText,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(inputText),
              Text(translatedText),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
