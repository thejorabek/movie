// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movie/core/models/upcoming.dart';

class UpcomingService {
  final String baseUrl = 'https://api.themoviedb.org/3/movie'; // Replace with actual API URL
  final String apiKey = '46f67d100a844a5a01bcbbe10ec06129'; // Replace with your API key

  Future<UpcomingModel> getUpcoming({int page = 1}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/upcoming?language=en-US&page=1&api_key=$apiKey'),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return upcomingModelFromJson(response.body);
    } else {
      throw Exception('Failed to load top rated items');
    }
  }
}
