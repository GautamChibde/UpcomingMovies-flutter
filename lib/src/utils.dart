
class Utils {
  static const String NO_NETWORK_IMAGE_PLACEHOLDER =
      "http://www.curtisint.com/wp-content/uploads/2016/06/placeholder.png";
  static const String ENDPOINT_IMAGE = "https://image.tmdb.org/t/p/";

  static Map<int, String> geners = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };

  static String getPosterImage(bool original, String posterUrl) {
    if (posterUrl == null) {
      return NO_NETWORK_IMAGE_PLACEHOLDER;
    }
    return ENDPOINT_IMAGE + (original ? "original" : "w500") + posterUrl;
  }

  static String getGeners(List<int> genreIds) =>
      genreIds.map((i) => geners[i]).toList().join(", ");
}
