import 'dart:convert';

import 'package:news_app_record/model/response.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  Future<ResponseNews> fetchNewsByProvider({required String provider}) async {
    final String url = 'https://berita-indo-api-next.vercel.app/api/$provider';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResponseNews.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('maaf gagal');
    }
  }
}
