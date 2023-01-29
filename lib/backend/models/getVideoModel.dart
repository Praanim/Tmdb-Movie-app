// To parse this JSON data, do
//
//     final videoUrl = videoUrlFromJson(jsonString);

import 'dart:convert';

class VideoUrl {
  VideoUrl({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String id;

  factory VideoUrl.fromJson(Map<String, dynamic> json) => VideoUrl(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "id": id,
      };
}
