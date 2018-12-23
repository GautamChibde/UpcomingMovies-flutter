import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:upcomming_movies_flutter/src/model/movie.dart';

import 'package:upcomming_movies_flutter/src/infra/api.dart';

void main() {
  test('Test parsing Upcoming movie results', () async {
    await File(Directory.current.path + "/test/movie_response.json")
        .readAsString()
        .then((String contents) {
      MoviesWrapper moviesWrapper = parseUpcomingMovies(contents);
      expect(moviesWrapper.page, 1);
      expect(moviesWrapper.movies.length, 20);
    });
  });

  test("Test movies api result", () async {
    MoviesWrapper moviesWrapper = await getUpcomingMovies(1);
    expect(moviesWrapper.page, 1);
    expect(moviesWrapper.movies.length, 20);
  });
}
