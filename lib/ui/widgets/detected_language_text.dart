import 'package:flutter/material.dart';


class DetectedLanguageText extends StatelessWidget {
  const DetectedLanguageText({required this.detectedLanguage, Key? key})
      : super(key: key);

  final String detectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        'Определить язык: $detectedLanguage',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}