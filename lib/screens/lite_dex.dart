import 'package:flutter/material.dart';
import 'package:litedex/screens/find_pokemon_by_name.dart';

class LiteDex extends StatelessWidget {
  const LiteDex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LiteDex",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pokedex Lite"),
        ),
        body: FindPokemonByName(key: key),
      ),
    );
  }
}
