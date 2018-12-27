import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/utils.dart';

class ImagePage extends StatelessWidget {
  final String _imageUrl;
  final int _index;

  const ImagePage(this._imageUrl, this._index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Stack(children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            child: Hero(
              tag: _index.toString() + "poster",
              child: Stack(fit: StackFit.expand, children: <Widget>[
                Center(child: CircularProgressIndicator()),
                Image.network(
                  Utils.getPosterImage(true, _imageUrl),
                  fit: BoxFit.fitWidth,
                )
              ]),
            ),
          ),
          Positioned(
            right: 24,
            top: 24,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 48,
                width: 48,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Colors.black),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]));
  }
}
