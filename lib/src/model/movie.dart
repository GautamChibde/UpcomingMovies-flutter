import 'dart:convert' as json;

class MoviesWrapper {
  int page;
  List<Movie> movies = [];

  MoviesWrapper({this.page, this.movies});

  MoviesWrapper.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    for (var result in json['results']) {
      Movie movie = Movie.fromJson(result);
      if (movie != null) {
        movies.add(movie);
      }
    }
  }
}

class Movie {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie(
      {this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Movie(
        voteCount: json['vote_count'],
        id: json['id'],
        video: json['video'],
        voteAverage: parseDouble(json['vote_average']),
        title: json['title'],
        popularity: parseDouble(json['popularity']),
        posterPath: json['poster_path'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        genreIds: json['genre_ids'].cast<int>(),
        backdropPath: json['backdrop_path'],
        adult: json['adult'],
        overview: json['overview'],
        releaseDate: json['release_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }

  static double parseDouble(dynamic value) {
    if (value is int) return value.toDouble();
    return value;
  }
}

MoviesWrapper parseUpcomingMovies(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  MoviesWrapper upcomingMovies = MoviesWrapper.fromJson(parsed);
  return upcomingMovies;
}
