import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'e2f564dd458268eaa0a50da86b6b547c';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData['dates']);
  }
}
