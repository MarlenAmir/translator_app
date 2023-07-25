import 'package:flutter/material.dart';


class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({required this.selectedLanguageCode, required this.onChanged, Key? key})
      : super(key: key);

  final String selectedLanguageCode;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Выберите язык:',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        DropdownButton<String>(
          value: selectedLanguageCode,
          onChanged: onChanged,
          items: <String>[
            'en', // English
            'es', // Spanish
            'fr', // French
            'kk', // Kazakh (kk is the ISO code for Kazakh)
            'ru', // Russian
          ].map<DropdownMenuItem<String>>((String value) {
            String languageName = _getLanguageName(value);
            return DropdownMenuItem<String>(
              value: value,
              child: Text(languageName),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';
      case 'kk':
        return 'Казахский'; // Kazakh
      case 'ru':
        return 'Russian';
      default:
        return 'Unknown';
    }
  }
}