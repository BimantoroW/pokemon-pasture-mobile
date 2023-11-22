// To parse this JSON data, do
//
//     final caughtPokemon = caughtPokemonFromJson(jsonString);

import 'dart:convert';

List<CaughtPokemon> caughtPokemonFromJson(String str) =>
    List<CaughtPokemon>.from(
        json.decode(str).map((x) => CaughtPokemon.fromJson(x)));

String caughtPokemonToJson(List<CaughtPokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CaughtPokemon {
  String model;
  int pk;
  Fields fields;

  CaughtPokemon({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory CaughtPokemon.fromJson(Map<String, dynamic> json) => CaughtPokemon(
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
  int pokemon;
  int owner;
  int amount;

  Fields({
    required this.pokemon,
    required this.owner,
    required this.amount,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        pokemon: json["pokemon"],
        owner: json["owner"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon,
        "owner": owner,
        "amount": amount,
      };
}
