import 'package:dio/dio.dart';
import '../models/news.dart';
import '../view/constants/endpoints.dart';

class HomeRepo {
  final Dio _dio = Dio();

  Future<News> getHeadlines(String countryCode) async {
    try {
      final response = await _dio.get(
       ApiEndpoints.getUrl(countryCode),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

    if(response.statusCode==200){
      return News.fromJson(response.data);

    }else{
      throw Exception('Failed to fetch headlines: ${response.statusMessage}');
    }

    } catch (e) {
      throw Exception('Error getting headlines: $e');
    }
  }


}