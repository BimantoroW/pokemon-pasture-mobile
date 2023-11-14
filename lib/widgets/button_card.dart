import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/screens/catch_form.dart';
import 'package:pokemon_pasture_mobile/screens/view_pokemon.dart';

class CardItem {
  final String name;
  final IconData icon;

  CardItem(this.name, this.icon);
}

class ButtonCard extends StatelessWidget {
  final CardItem item;

  const ButtonCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "View Pokémon") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ViewPokemon()));
          } else if (item.name == "Catch Pokémon") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CatchFormPage()));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
