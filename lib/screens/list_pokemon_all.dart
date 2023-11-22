import 'package:flutter/material.dart';
import 'package:pokemon_pasture_mobile/screens/pokemon_detail.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'package:pokemon_pasture_mobile/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewPokemonPage extends StatefulWidget {
  const ViewPokemonPage({super.key});

  @override
  State<ViewPokemonPage> createState() => _ViewPokemonPageState();
}

class _ViewPokemonPageState extends State<ViewPokemonPage> {
  late Future<List<Pokemon>> futureListPokemon;

  @override
  void initState() {
    super.initState();
    futureListPokemon = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder<List<Pokemon>>(
            future: futureListPokemon,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Pokemon> list = snapshot.data! as List<Pokemon>;
                if (list.isEmpty) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokemonDetailPage(pokemon: list[index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )));
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<Pokemon>> fetchPokemon() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/json/'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      List<Pokemon> listPokemon = [];
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var d in data) {
        if (data != null) {
          listPokemon.add(Pokemon.fromJson(d));
        }
      }
      return listPokemon;
    } else {
      throw Exception("Failed to load Pokémon");
    }
  }
}
