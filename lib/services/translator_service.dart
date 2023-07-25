import 'package:dio/dio.dart';

class TranslatorService {
  final Dio _dio = Dio();
  final String _apiKey;

  TranslatorService(this._apiKey);

  Future<Map<String, dynamic>> translateText(String inputText, String targetLanguage) async {
    try {
      final response = await _dio.post(
        'https://translation.googleapis.com/language/translate/v2',
        queryParameters: {'key': _apiKey},
        data: {'q': inputText, 'target': targetLanguage},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return {
          'translatedText': data['data']['translations'][0]['translatedText'],
          'detectedLanguage': data['data']['translations'][0]['detectedSourceLanguage'],
        };
      } else {
        // Handle error response here
        print('Translation API error: ${response.statusCode}');
        return {};
      }
    } catch (error) {
      // Handle Dio error here
      print('Dio error: $error');
      return {};
    }
  }
}


