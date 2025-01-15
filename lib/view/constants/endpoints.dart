import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static String getUrl(String country) {
    return '$baseUrl?country=$country&apiKey=$apiKey';
  }
}