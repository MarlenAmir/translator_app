import 'package:flutter/material.dart';
import 'package:translator_app/ui/widgets/view.dart';
import 'package:translator_app/services/translator_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _selectedLanguageCode = 'en';
  String _translatedText = '';
  String _detectedLanguage = '';

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  final TranslatorService _translatorService = TranslatorService(
    'AIzaSyDpu4nv9KNpmPSSAHRk-yJ7sbYDMb5vy4o', // Api key
  );

  List<Map<String, dynamic>> _items = [];

  final favorite_translations = Hive.box('favorite_translations');

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await favorite_translations.add(newItem);
    _refreshItems();
    print('amount data is ${favorite_translations.length}');
  }

  List<Map<String, dynamic>> _refreshItems() {
    final data = favorite_translations.keys.map((key) {
      final item = favorite_translations.get(key);
      return {
        "key": key,
        "inputText": item["inputText"],
        "translatedText": item["translatedText"]
      };
    }).toList();
    setState(() {
      _items = data.reversed.toList();
    });
    return data;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Translate API')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DetectedLanguageText(detectedLanguage: _detectedLanguage),
            const SizedBox(height: 20),
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Введите текст для перевода",
              ),
            ),
            const SizedBox(height: 20),
            LanguageDropdown(
              selectedLanguageCode: _selectedLanguageCode,
              onChanged: (String? newValue) {
                // Change to nullable String
                setState(() {
                  _selectedLanguageCode =
                      newValue ?? 'en'; // Provide a default value if null
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String inputText = _textEditingController.text;
                Map<String, dynamic> translationResult =
                    await _translatorService.translateText(
                  inputText,
                  _selectedLanguageCode,
                );
                setState(() {
                  _translatedText = translationResult['translatedText'] ?? '';
                  _detectedLanguage =
                      translationResult['detectedLanguage'] ?? '';
                });
              },
              child: Text('Перевести', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 30),
            Text(
              'Перевод:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 20),
            TranslatedTextWidget(translatedText: _translatedText),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String inputText = _textEditingController.text;
                if (inputText.isNotEmpty && _translatedText.isNotEmpty) {
                  await createItem({
                    "inputText": inputText,
                    "translatedText": _translatedText,
                  });
                }
                showSnackbar('Added to Favorites');
              },
              child:
                  Text('Добавить в избранные', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
