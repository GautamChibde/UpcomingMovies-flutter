import 'package:flutter/material.dart';

import 'package:upcomming_movies_flutter/src/constants.dart';
import 'package:upcomming_movies_flutter/src/ui/movie_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(APP_NAME))),
        body: MovieList()
    );
  }
}
