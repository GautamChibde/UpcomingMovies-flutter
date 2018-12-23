import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/infra/api.dart';
import 'package:upcomming_movies_flutter/src/model/movie.dart';
import 'package:upcomming_movies_flutter/src/ui/movie_list_item.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
          future: getUpcomingMovies(1),
          builder:
              (BuildContext context, AsyncSnapshot<MoviesWrapper> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieListItem(snapshot.data.movies[index]);
                },
              );
            } else {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
          }),
    ));
  }
}
