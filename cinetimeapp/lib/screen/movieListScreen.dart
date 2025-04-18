import 'package:flutter/material.dart';
import 'package:cinetimeapp/services/apiSercives.dart';
import 'package:cinetimeapp/screen/movieDetailScreen.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Map<String, String>> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies(); // ✅ Call the private method
  }

  // ✅ Class-learning private method to load movies
  Future<void> _loadMovies() async {
    final fetchedMovies = await ApiService.fetchNowPlayingMovies();
    setState(() {
      movies = fetchedMovies;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        backgroundColor: Colors.redAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: (movies.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final first = movies[index * 2];
                  final second = index * 2 + 1 < movies.length
                      ? movies[index * 2 + 1]
                      : null;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: MovieCard(movie: first)),
                        SizedBox(width: 16),
                        if (second != null)
                          Expanded(child: MovieCard(movie: second))
                        else
                          Expanded(child: Container()),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

// ✅ Widget to display a single movie card
class MovieCard extends StatelessWidget {
  final Map<String, String> movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          movie['image']!,
          height: 160,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 100),
        ),
        SizedBox(height: 8),
        Text(
          movie['title']!,
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailScreen(movie: movie),
              ),
            );
          },
          child: Text("Details"),
        ),
      ],
    );
  }
}
