import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'package:pokemon_pasture_mobile/widgets/button_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<CardItem> items = [
    CardItem("View All Pokémon", Icons.checklist),
    CardItem("View Your Pokémon", Icons.yard),
    CardItem("Create Pokémon", Icons.add_circle),
    CardItem("Catch Pokémon", Icons.add_home_work),
    CardItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Pokemon Pasture"),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(20), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome, User', // Text yang menandakan toko
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 5,
                shrinkWrap: true,
                children: items.map((CardItem item) {
                  // Iterasi untuk setiap item
                  return ButtonCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}
