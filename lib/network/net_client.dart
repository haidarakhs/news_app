import 'dart:convert';

import 'package:news_app_record/model/response.dart';
import 'package:http/http.dart' as http;

class NetClient {
  final String url = 'https://berita-indo-api-next.vercel.app/api/';
  Future<ResponseNews> fetchByProvider({required String provider}) async {
    final String endPoint = '$provider';
    final String fullUrl = url + endPoint;

    try{
      final response = await http.get(Uri.parse(fullUrl));
      
      if (response.statusCode == 200) {
        return ResponseNews.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    }catch (e){
      print('error news: $e');
      throw Exception('failed to load news');
    }
  }
}
