import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litedex/components/pokemon_details.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: SvgPicture.network(
              pokemon.image,
              fit: BoxFit.scaleDown,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(),
            ),
          ),
        ),
        PokemonDetails(pokemon: pokemon),
      ],
    );
  }
}
