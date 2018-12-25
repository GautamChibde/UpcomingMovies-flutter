import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie.dart';
import 'package:upcomming_movies_flutter/src/utils.dart';
import 'package:upcomming_movies_flutter/src/rating_bar.dart';

class DetailPage extends StatelessWidget {
  final Movie _movie;

  DetailPage(this._movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
      children: <Widget>[
          Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipPath(
                child: FadeInImage.assetNetwork(
                  height: 260,
                  placeholder: "assets/loading_placeholder.gif",
                  image: Utils.getPosterImage(false, _movie.backdropPath),
                  fit: BoxFit.fill,
                ),
                clipper: new BottomImageClipper(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(
                  _movie.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  Utils.getGeners(_movie.genreIds),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RatingBar(
                        numStars: 5,
                        rating: _movie.voteAverage / 2,
                        onChanged: null),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        "${_movie.voteAverage.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.orangeAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        "/10",
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _movie.overview,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 64,
            child: Hero(
              tag: _movie.title,
              child: Container(
                height: 180,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/loading_placeholder.gif",
                  image: Utils.getPosterImage(false, _movie.posterPath),
//                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )
      ],
    ),
        ));
  }
}

class BottomImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
