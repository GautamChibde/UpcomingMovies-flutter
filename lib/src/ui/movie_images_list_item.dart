import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/model/movie_images.dart';

import 'package:upcomming_movies_flutter/src/utils.dart';

import 'package:upcomming_movies_flutter/src/ui/image_page.dart';

class MovieImageListItem extends StatelessWidget {
  final Posters _poster;
  final int _index;

  MovieImageListItem(this._poster, this._index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImagePage(_poster.filePath, this._index),
            ),
          );
        },
        child: Container(
          height: 180,
          width: 111,
          child: Hero(
            tag: _index.toString() + "poster",
            child: FadeInImage.assetNetwork(
              placeholder: "assets/loading_placeholder.gif",
              image: Utils.getPosterImage(false, _poster.filePath),
              fit: BoxFit.fitHeight,
            ),
          ),
        ));
  }
}
