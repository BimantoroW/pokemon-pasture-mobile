import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'package:pokemon_pasture_mobile/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        drawer: const LeftDrawer(),
        body: Center(
          child: Column(
            children: [
              Text("Model: ${pokemon.model}"),
              const SizedBox(height: 10),
              Text("ID: ${pokemon.pk}"),
              const SizedBox(height: 10),
              Text("Name: ${pokemon.fields.name}"),
              const SizedBox(height: 10),
              Text("Pokedex Number: ${pokemon.fields.pokedexNumber}"),
              const SizedBox(height: 10),
              Text("Description: ${pokemon.fields.description}"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ));
  }
}
