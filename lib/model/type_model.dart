import 'dart:convert';

import 'package:generat_app/model/higth_model.dart';

class TypeModel extends HightModel {
  int? id;
  String? title;
  int? year;
  List<String>? genre;
  double? rating;
  String? plot;
  String? poster;
  String? trailer;
  int? runtime;
  String? country;
  String? language;
  String? website;

  TypeModel({
    this.id,
    this.title,
    this.year,
    this.genre,
    this.rating,
    this.plot,
    this.poster,
    this.trailer,
    this.runtime,
    this.country,
    this.language,
    this.website,
  });

  TypeModel copyWith({
    int? id,
    String? title,
    int? year,
    List<String>? genre,
    double? rating,
    String? plot,
    String? poster,
    String? trailer,
    int? runtime,
    String? country,
    String? language,
    String? website,
  }) =>
      TypeModel(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year ?? this.year,
        genre: genre ?? this.genre,
        rating: rating ?? this.rating,
        plot: plot ?? this.plot,
        poster: poster ?? this.poster,
        trailer: trailer ?? this.trailer,
        runtime: runtime ?? this.runtime,
        country: country ?? this.country,
        language: language ?? this.language,
        website: website ?? this.website,
      );

  fromJson(String str) => fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  @override
  fromMap(Map<String, dynamic> json) => TypeModel(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genre: json["genre"] == null
            ? []
            : List<String>.from(json["genre"]!.map((x) => x)),
        rating: json["rating"]?.toDouble(),
        plot: json["plot"],
        poster: json["poster"],
        trailer: json["trailer"],
        runtime: json["runtime"],
        country: json["country"],
        language: json["language"],
        website: json["website"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "year": year,
        "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => x)),
        "rating": rating,
        "plot": plot,
        "poster": poster,
        "trailer": trailer,
        "runtime": runtime,
        "country": country,
        "language": language,
        "website": website,
      };
}
