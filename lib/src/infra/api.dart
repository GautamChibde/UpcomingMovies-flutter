import 'package:http/http.dart' as http;
import 'package:upcomming_movies_flutter/src/model/movie.dart';

const String API_URL = "https://api.themoviedb.org/3/";

const String API_KEY = "b7cd3340a794e5a2f35e3abb820b497f";
const String ENDPINT_IMAGE = "http://image.tmdb.org/t/p/w500/";

const String UPCOMING_MOVIES = "movie/upcoming";

Future<MoviesWrapper> getUpcomingMovies(int page) async {
  final String url = API_URL + UPCOMING_MOVIES + "?api_key=" + API_KEY + "&page=" + page.toString();
  var data = await http.get(url);

  MoviesWrapper moviesWrapper = parseUpcomingMovies(data.body);

  return moviesWrapper;
}
