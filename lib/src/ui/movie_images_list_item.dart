import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie_images.dart';

import 'package:upcomming_movies_flutter/src/utils.dart';

class MovieImageListItem extends StatelessWidget {
  final Posters _poster;

  MovieImageListItem(this._poster);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => DetailPage(_poster),
//          ),
//        );
        },
        child: Container(
          height: 180,
          width: 111,
          child: Container(
              height: 180,
              width: 111,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/loading_placeholder.gif",
                image: Utils.getPosterImage(false, _poster.filePath),
                fit: BoxFit.fitHeight,
              )),
        ));
  }
}
