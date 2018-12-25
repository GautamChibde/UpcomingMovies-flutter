import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'dart:convert' as json;

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

  test("Test movies api result", () async {
    var data = await http.get("https://api.themoviedb.org/3/genre/movie/list?api_key=b7cd3340a794e5a2f35e3abb820b497f&language=en-US");

    final parsed = await json.jsonDecode(data.body);
    Data.fromJson(parsed);
  });
}

class Data {
  int id;
  String name;

  Data.fromJson(Map<String, dynamic> data) {
    for(var i  in data['genres']) {
      id = i['id'];
      name = i['name'];
      print("$id : \"$name\",");
    }
  }
}
