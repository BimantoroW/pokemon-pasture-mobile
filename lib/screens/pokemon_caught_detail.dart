import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/models/caught_pokemon.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';

class PokemonCaughtDetailPage extends StatelessWidget {
  final CaughtPokemon caughtPokemon;
  PokemonCaughtDetailPage({super.key, required this.caughtPokemon});

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
              Text("Model: ${caughtPokemon.model}"),
              const SizedBox(height: 10),
              Text("ID: ${caughtPokemon.pk}"),
              const SizedBox(height: 10),
              Text("Pokemon ID: ${caughtPokemon.fields.pokemon}"),
              const SizedBox(height: 10),
              Text("Owner ID: ${caughtPokemon.fields.owner}"),
              const SizedBox(height: 10),
              Text("Amount caught: ${caughtPokemon.fields.amount}"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        )
    );
  }
}
