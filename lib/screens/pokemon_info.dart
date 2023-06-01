import 'package:flutter/material.dart';
import 'package:litedex/components/not_found.dart';
import 'package:litedex/components/pokemon_info.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonInfoScreen extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfoScreen({Key? key, required this.pokemon}) : super(key: key);

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  showInformation(BuildContext context) {
    if (pokemon != null) {
      return PokemonInfo(key: key, pokemon: pokemon!);
    } else {
      return const PokemonNotFound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: showInformation(context),
    );
  }
}