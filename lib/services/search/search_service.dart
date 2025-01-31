import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchService {
  static Future<List<String>> searchItems(String query) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/search/multi?api_key=46f67d100a844a5a01bcbbe10ec06129&query=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((item) => item['name'].toString()).toList();
    } else {
      throw Exception('Failed to load results');
    }
  }
}