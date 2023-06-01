import 'package:flutter/material.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  
  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Altura: ${pokemon.height}')
      ],
    );
  }
}