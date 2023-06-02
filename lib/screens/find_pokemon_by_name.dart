import 'package:flutter/material.dart';
import 'package:litedex/http/webclient.dart';
import 'package:litedex/model/pokemon.dart';
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
  bool loading = false;

  setLoading(bool isLoading) {
    setState(() {
      loading = isLoading;
    });
  }

  goToInfoScreen(Pokemon? pokemon) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PokemonInfoScreen(pokemon: pokemon),
    ));
  }

  searchPokemon() async {
    if (_nameController.text == '') return;

    final pokemonName = _nameController.text.toLowerCase().trim();
    _nameController.text = '';
    setLoading(true);

    final pokemon = await getPokemonByName(pokemonName);

    setLoading(false);
    goToInfoScreen(pokemon);
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
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 2, bottom: 8),
              child: Visibility(
                  visible: loading,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: const LinearProgressIndicator())),
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
