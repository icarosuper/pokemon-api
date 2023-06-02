import 'package:flutter/material.dart';
import 'package:litedex/components/details_box.dart';
import 'package:litedex/helpers/pokemon_type_colors.dart';
import 'package:litedex/model/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetails({super.key, required this.pokemon});

  firstLetterToUpper(String text) {
    return text.replaceFirst(text[0], text[0].toUpperCase());
  }

  styledText(BuildContext context, String text,
      {double size = 20, Color? color}) {
    return Text(text,
        style: TextStyle(
            fontSize: size, color: color ?? Colors.black.withOpacity(.83)));
  }

  detailsLine(BuildContext context, String name, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [styledText(context, name), styledText(context, value)],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              height: 1,
              color: Colors.black26,
            )),
      ],
    );
  }

  pokemonTypes(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        styledText(context, 'Tipos:'),
        Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List<Widget>.from(pokemon.types.map((type) => Container(
                  decoration: BoxDecoration(
                      color: pokemonTypeColors[type],
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(bottom: 3),
                  child: styledText(context, firstLetterToUpper(type),
                      color: Colors.white10.withOpacity(.9)),
                ))))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DetailsBox(children: [
      detailsLine(context, 'Nome', firstLetterToUpper(pokemon.name)),
      detailsLine(context, 'Vida', pokemon.stats.hp.toString()),
      detailsLine(context, 'Ataque', pokemon.stats.attack.toString()),
      detailsLine(context, 'Defesa', pokemon.stats.defense.toString()),
      detailsLine(context, 'Velocidade', pokemon.stats.speed.toString()),
      detailsLine(
          context, 'Ataque especial', pokemon.stats.specialAttack.toString()),
      detailsLine(
          context, 'Defesa especial', pokemon.stats.specialDefense.toString()),
      detailsLine(context, 'Altura', pokemon.height.toString()),
      detailsLine(context, 'Peso', pokemon.weight.toString()),
      pokemonTypes(context),
    ]);
  }
}
