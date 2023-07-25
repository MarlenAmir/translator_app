import 'package:flutter/material.dart';

class TranslatedTextWidget extends StatelessWidget {
  const TranslatedTextWidget({required this.translatedText, Key? key}) : super(key: key);

  final String translatedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Переведенный язык:',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 20),
        Container(
          height: 120,
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            child: Text(
              translatedText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}