import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie.dart';
import 'package:upcomming_movies_flutter/src/ui/detail_page.dart';
import 'package:upcomming_movies_flutter/src/utils.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(movie),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Container(
          height: 180,
          child: Row(
            children: <Widget>[
              Hero(
                tag: movie.title,
                child: Container(
                    height: 180,
                    width: 101,
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/loading_placeholder.gif",
                      image: Utils.getPosterImage(false, movie.posterPath),
                      fit: BoxFit.fitHeight,
                    )),
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.title ?? "N/A",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
