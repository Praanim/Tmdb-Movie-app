// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

String notFoundImage =
    'https://imgs.search.brave.com/A_PbIOfM-hxkSoGkZ0XISKfHbXv0EKrNkNL8fkVkll4/rs:fit:1150:647:1/g:ce/aHR0cHM6Ly93d3cu/c2Fsb25sZmMuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE4/LzAxL2ltYWdlLW5v/dC1mb3VuZC0xLXNj/YWxlZC0xMTUweDY0/Ny5wbmc';

class Movie {
  Movie({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
  });

  bool adult;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"] ?? "not found",
        id: json["id"],
        name: json["name"] ?? "no name",
        originalLanguage: json["original_language"] ?? "not found",
        originalName: json["original_name"] ?? "not found",
        overview: json["overview"] ?? "not found",
        posterPath: json["poster_path"] ?? notFoundImage,
        mediaType: json["media_type"] ?? "not found",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "id": id,
        "name": name,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
      };
}
