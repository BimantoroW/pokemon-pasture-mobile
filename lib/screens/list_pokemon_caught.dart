import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pokemon_pasture_mobile/models/caught_pokemon.dart';
import 'package:pokemon_pasture_mobile/screens/pokemon_caught_detail.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class ViewCaughtPage extends StatefulWidget {
  const ViewCaughtPage({super.key});

  @override
  State<ViewCaughtPage> createState() => _ViewCaughtPageState();
}

class _ViewCaughtPageState extends State<ViewCaughtPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder<List<CaughtPokemon>>(
            future: fetchCaughtPokemon(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<CaughtPokemon> list =
                    snapshot.data! as List<CaughtPokemon>;
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
                                  builder: (context) => PokemonCaughtDetailPage(caughtPokemon: list[index])));
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
                                  "Pokemon ID: ${list[index].fields.pokemon}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Owner ID: ${list[index].fields.owner}"),
                                const SizedBox(height: 10),
                                Text(
                                    "Amount caught: ${list[index].fields.amount}")
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

  Future<List<CaughtPokemon>> fetchCaughtPokemon(CookieRequest request) async {
    final response = await request.postJson(
        "http://localhost:8000/json-caught/",
        jsonEncode(<String, String>{
          'place': 'holder',
        }));
    List<CaughtPokemon> listCaught = [];
    for (var d in response) {
      if (d != null) {
        listCaught.add(CaughtPokemon.fromJson(d));
      }
    }
    return listCaught;
  }
}
