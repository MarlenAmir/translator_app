import 'package:dio/dio.dart';

class TranslationService {
  final String apiKey;
  final Dio _dio;

  TranslationService(this.apiKey) : _dio = Dio();

  Future<String> translateWord(String text, String targetLanguage) async {
    final url = 'https://translation.googleapis.com/language/translate/v2';

    try {
      final response = await _dio.post(url, data: {
        'q': text,
        'target': targetLanguage,
        'key': apiKey,
      });

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['data'] != null &&
            responseData['data']['translations'] != null &&
            responseData['data']['translations'][0] != null &&
            responseData['data']['translations'][0]['translatedText'] != null) {
          String translatedText = responseData['data']['translations'][0]['translatedText'];
          return translatedText;
        } else {
          throw Exception('Invalid API response. Translation not available.');
        }
      } else {
        throw Exception('Error occurred during the API request.');
      }
    } catch (e) {
      throw Exception('Error while executing the API request: $e');
    }
  }
}

