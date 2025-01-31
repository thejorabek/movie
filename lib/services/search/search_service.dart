import 'package:movie/core/models/searched.dart';
import 'package:dio/dio.dart';

class SearchService {
  final Dio dio;

  SearchService({required this.dio});

  Future<List<Result>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/search/movie',
        queryParameters: {
          'api_key': '46f67d100a844a5a01bcbbe10ec06129',
          'query': query,
        },
      );
      
      if (response.data['results'] == null) {
        return [];
      }

      final List<dynamic> results = response.data['results'] as List<dynamic>;
      return results
          .map((json) => Result.fromJson(json as Map<String, dynamic>))
          .toList();
          
    } catch (e) {
      print('Search error: $e');
      return [];
    }
  }
}
