import 'package:flutter/material.dart';
import 'package:translator_app/generated/l10n.dart';
import 'package:translator_app/ui/widgets/view.dart';
import 'package:translator_app/services/translator_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:translator_app/snackbar/snackbar_helper.dart';

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

  final TranslatorService _translatorService = TranslatorService(
    'AIzaSyDpu4nv9KNpmPSSAHRk-yJ7sbYDMb5vy4o', // Api key
  );

  final favoriteTranslations = Hive.box(
      'favorite_translations'); // Бокс для хранения избранных переводов

  Future<void> createItem(Map<String, dynamic> newItem) async {
    // Метод для добавления элемента в базу данных
    await favoriteTranslations.add(newItem);
    _refreshItems();
  }

// метод для обновления списка элементов с определенными полями
  List<Map<String, dynamic>> _refreshItems() {
    final data = favoriteTranslations.keys.map((key) {
      final item = favoriteTranslations.get(key);
      return {
        "key": key,
        "inputText": item["inputText"],
        "translatedText": item["translatedText"]
      };
    }).toList();
    setState(() {});
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Translate API',
          ),
        ),
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
                setState(() {
                  _selectedLanguageCode = newValue ?? 'en';
                });
              },
            ),
            const SizedBox(height: 20),
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
              child: Text(S.of(context).translate,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
            TranslatedTextWidget(translatedText: _translatedText),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String inputText = _textEditingController.text;
                if (inputText.isNotEmpty && _translatedText.isNotEmpty) {
                  await createItem({
                    "inputText": inputText,
                    "translatedText": _translatedText,
                  });
                }
                SnackbarHelper.showSnackbar(context, 'Added to Favorites');
              },
              child: Text(S.of(context).addToFavorites,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
