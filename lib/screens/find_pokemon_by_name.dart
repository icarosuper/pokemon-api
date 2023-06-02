import 'package:flutter/material.dart';
import 'package:litedex/http/webclient.dart';
import 'package:litedex/screens/pokemon_info.dart';

class FindPokemonByName extends StatefulWidget {
  const FindPokemonByName({Key? key}) : super(key: key);

  @override
  State<FindPokemonByName> createState() => _FindPokemonByNameState();
}

class _FindPokemonByNameState extends State<FindPokemonByName>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  late AnimationController _controller;

  searchPokemon() {
    final pokemonName = _nameController.text.toLowerCase().trim();
    _nameController.text = '';

    getPokemonByName(pokemonName).then(
      (pokemon) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PokemonInfoScreen(pokemon: pokemon),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Insira o nome de um Pokémon ou um número.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: searchPokemon,
              child: const Text("Buscar"),
            ),
          ),
        ],
      ),
    );
  }
}
