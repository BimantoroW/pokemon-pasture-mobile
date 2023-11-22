import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pokemon_pasture_mobile/screens/catch_form.dart';
import 'package:pokemon_pasture_mobile/screens/create_form.dart';
import 'package:pokemon_pasture_mobile/screens/list_pokemon_all.dart';
import 'package:pokemon_pasture_mobile/screens/list_pokemon_caught.dart';
import 'package:pokemon_pasture_mobile/screens/login.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();

    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "View All Pokémon") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewPokemonPage()));
          } else if (item.name == "View Your Pokémon") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViewCaughtPage()));
          } else if (item.name == "Catch Pokémon") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CatchFormPage()));
          } else if (item.name == "Create Pokémon") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateFormPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            }
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
