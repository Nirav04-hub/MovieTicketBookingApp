import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey =
      'c4f69f1c196a4e50513bf0793f6c3748'; // replace later
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // Get latest movies (now playing)
  static Future<List<Map<String, String>>> fetchNowPlayingMovies() async {
    final url =
        '$_baseUrl/movie/now_playing?api_key=$_apiKey&language=en-US&page=1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];

      return results.map<Map<String, String>>((movie) {
        return {
          'title': movie['title'],
          'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
          'overview': movie['overview'],
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
