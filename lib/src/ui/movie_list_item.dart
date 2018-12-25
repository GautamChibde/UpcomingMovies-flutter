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
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Container(
          height: 180,
          child: Stack(children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: movie.title,
                  child: Container(
                      height: 180,
                      width: 111,
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/loading_placeholder.gif",
                        image: Utils.getPosterImage(false, movie.posterPath),
                        fit: BoxFit.fitHeight,
                      )),
                ),
                new Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Hero(
                            tag: movie.id.toString() + "title",
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                movie.title ?? "N/A",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: movie.id.toString() + "genre",
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                Utils.getGeners(movie.genreIds),
                                style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Hero(
                            tag: movie.id.toString() + "overview",
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                movie.overview ?? "N/A",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14, fontFamily: 'Lato'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 130,
              left: 90,
              child: Container(
                  height: 42,
                  width: 42,
                  child: RawMaterialButton(
                    fillColor: Colors.orangeAccent,
                    elevation: 8,
                    shape: CircleBorder(),
                    child: Text(
                      "${movie.voteAverage ?? ""}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
                    onPressed: () {},
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
