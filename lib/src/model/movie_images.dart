import 'dart:convert' as json;

class MovieImages {
  int id;
  List<Posters> posters = [];

  MovieImages({this.id, this.posters});

  MovieImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['posters'] != null) {
      json['posters'].forEach((v) {
        posters.add(new Posters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.posters != null) {
      data['posters'] = this.posters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posters {
  String filePath;

  Posters({this.filePath});

  Posters.fromJson(Map<String, dynamic> json) {
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

MovieImages parseMovieImages(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  MovieImages movieImages = MovieImages.fromJson(parsed);
  return movieImages;
}