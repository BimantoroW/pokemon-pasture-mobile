import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'package:pokemon_pasture_mobile/models/pokemon.dart';

class ViewPokemon extends StatelessWidget {
  const ViewPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Your Pokémon"),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: Pokemon.pokemons.map((pokemon) {
              return Card(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Name: ${pokemon.name}"),
                      Text("Caught: ${pokemon.amount}"),
                      Text("Description: ${pokemon.description}"),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
