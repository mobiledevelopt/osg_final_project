import 'dart:convert';

FilterKategori filterKategoriFromJson(String str) => FilterKategori.fromJson(json.decode(str));

String filterKategoriToJson(FilterKategori data) => json.encode(data.toJson());

class FilterKategori {
  List<Map<String, String>> meals;

  FilterKategori({
    this.meals,
  });

  factory FilterKategori.fromJson(Map<String, dynamic> json) => FilterKategori(
    meals: List<Map<String, String>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
  };
}
