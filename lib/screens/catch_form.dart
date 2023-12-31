import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:pokemon_pasture_mobile/screens/menu.dart';
import 'package:pokemon_pasture_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class CatchFormPage extends StatefulWidget {
  const CatchFormPage({super.key});

  @override
  State<CatchFormPage> createState() => _CatchFormPageState();
}

class _CatchFormPageState extends State<CatchFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Catch New Pokémon!',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Pokémon Name",
                    labelText: "Pokémon Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                            "http://localhost:8000/catch-flutter/",
                            jsonEncode(<String, String>{
                              'name': _name,
                            }));
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text("New Pokémon caught!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content:Text("No such pokemon with that name."),
                          ));
                        }
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
