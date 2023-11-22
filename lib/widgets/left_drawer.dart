import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/screens/catch_form.dart';
import 'package:pokemon_pasture_mobile/screens/list_pokemon_caught.dart';
import 'package:pokemon_pasture_mobile/screens/menu.dart';
import 'package:pokemon_pasture_mobile/screens/create_form.dart';
import 'package:pokemon_pasture_mobile/screens/list_pokemon_all.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Pokémon Pasture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catch new Pokémon and view all the Pokémon you've caught!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('View All Pokémon'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewPokemonPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.yard),
            title: const Text('View Your Pokémon'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewCaughtPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Create Pokémon'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_home_work),
            title: const Text('Catch Pokémon'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatchFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
