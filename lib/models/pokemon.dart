// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  String model;
  int pk;
  Fields fields;

  Pokemon({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  int pokedexNumber;
  String description;

  Fields({
    required this.name,
    required this.pokedexNumber,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        pokedexNumber: json["pokedex_number"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pokedex_number": pokedexNumber,
        "description": description,
      };
}
