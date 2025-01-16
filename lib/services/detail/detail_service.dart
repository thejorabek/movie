// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movie/core/models/detail.dart';

class MovieService {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String apiKey = '46f67d100a844a5a01bcbbe10ec06129';

  Future<DetailMovie> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return detailMovieFromJson(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
