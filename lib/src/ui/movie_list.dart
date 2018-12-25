import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/infra/api.dart';
import 'package:upcomming_movies_flutter/src/model/movie.dart';
import 'package:upcomming_movies_flutter/src/ui/movie_list_item.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  int _page = 1;
  bool _loading = true;
  ScrollController _controller;
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _getMovies(_page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: _loading && _movies.isEmpty
          ? AlignmentDirectional.center
          : AlignmentDirectional.bottomCenter,
      children: <Widget>[
        ListView.builder(
            controller: _controller,
            itemCount: _movies.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieListItem(_movies[index], index);
            }),
        Opacity(
          child: CircularProgressIndicator(),
          opacity: _loading ? 1 : 0,
        )
      ],
    ));
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        this._loading = true;
      });
      _getMovies(_page);
    }
  }

  void _getMovies(int page) {
    getUpcomingMovies(page).then((value) {
      setState(() {
        this._loading = false;
        this._movies.addAll(value.movies);
        this._page++;
      });
    });
  }
}
