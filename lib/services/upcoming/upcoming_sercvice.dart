// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movie/core/models/top_rated.dart';

class UpcomingService {
  final String baseUrl = 'https://api.themoviedb.org/3/movie'; // Replace with actual API URL
  final String apiKey = '46f67d100a844a5a01bcbbe10ec06129'; // Replace with your API key

  Future<TopRatedModel> getUpcoming({int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/upcoming?api_key=$apiKey&page=$page'),
    );

    if (response.statusCode == 200) {
      return topRatedModelFromJson(response.body);
    } else {
      throw Exception('Failed to load top rated items');
    }
  }
}
