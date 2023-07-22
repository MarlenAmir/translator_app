import 'package:flutter/material.dart';
import 'package:translator_app/services/translator_service.dart';

class  HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    final TranslationService translationService = TranslationService('AIzaSyDmf-zlsUHhh_9kgfAfXfsUdGqWmiiYSQU');


  String originalText = '';
  String translatedText = '';
  String targetLanguage = 'en'; // По умолчанию целевой язык - английский

  void _translateWord() async {
    try {
      String translation = await translationService.translateWord(originalText, targetLanguage);
      setState(() {
        translatedText = translation;
      });
    } catch (error) {
      print('Произошла ошибка при переводе: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Перевод слова')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  originalText = text;
                });
              },
              decoration: InputDecoration(labelText: 'Введите слово для перевода'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: targetLanguage,
              items: [
                DropdownMenuItem(child: Text('Английский'), value: 'en'),
                DropdownMenuItem(child: Text('Испанский'), value: 'es'),
                // Добавьте другие языки в списке
              ],
              onChanged: (value) {
                setState(() {
                  targetLanguage = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Выберите целевой язык'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _translateWord,
              child: Text('Перевести'),
            ),
            SizedBox(height: 16.0),
            Text('Перевод: $translatedText'),
          ],
        ),
      ),
    );
  }
}


