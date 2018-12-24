import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie.dart';
import 'package:upcomming_movies_flutter/src/constants.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        height: 180,
        child: Row(
          children: <Widget>[
            Container(
              height: 180,
              width: 101,
              child:
              FadeInImage.assetNetwork(
                placeholder: "assets/loading_placeholder.gif",
                image: _getPostImage(movie.posterPath),
                fit: BoxFit.fitHeight,
              )
            ),
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      movie.overview ?? "N/A",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.orangeAccent),
                          Text(
                              movie.voteAverage.toString() ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getPostImage(String posterUrl) {
    if (posterUrl == null) {
      return NO_NETWORK_IMAGE_PLACEHOLDER;
    }
    return ENDPOINT_IMAGE + posterUrl;
  }
}
