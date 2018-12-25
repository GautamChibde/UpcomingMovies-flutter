import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie_images.dart';
import 'package:upcomming_movies_flutter/src/ui/movie_images_list_item.dart';
import 'package:upcomming_movies_flutter/src/infra/api.dart';

class MovieImagesList extends StatefulWidget {
  final int _movieId;

  const MovieImagesList(this._movieId);

  @override
  State<StatefulWidget> createState() {
    return MovieImagesListState(_movieId);
  }
}

class MovieImagesListState extends State<MovieImagesList> {
  List<Posters> _posters = [];
  final int _movieId;

  MovieImagesListState(this._movieId);

  @override
  void initState() {
    super.initState();
    _getMovieImages();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _posters.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieImageListItem(_posters[index], index);
              }),
          Opacity(
            child: CircularProgressIndicator(),
            opacity: _posters.isEmpty ? 1 : 0,
          )
        ]),
      ),
    );
  }

  _getMovieImages() {
    getMovieImages(_movieId).then((value) {
      print(value);
      setState(() {
        this._posters.addAll(value.posters);
      });
    });
  }
}
