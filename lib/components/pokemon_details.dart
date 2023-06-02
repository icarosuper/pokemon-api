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

  @override
  Widget build(BuildContext context) {
    styledText(String text, {double size = 20, Color? color}) {
      return Text(text,
          style: TextStyle(
              fontSize: size, color: color ?? Colors.black.withOpacity(.83)));
    }

    detailsLine(String name, String value) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [styledText(name), styledText(value)],
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

    pokemonTypes() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          styledText('Tipos:'),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List<Widget>.from(pokemon.types.map((type) => Container(
                    decoration: BoxDecoration(
                        color: pokemonTypeColors[type],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.only(bottom: 3),
                    child: styledText(firstLetterToUpper(type),
                        color: Colors.white10.withOpacity(.9)),
                  ))))
        ],
      );
    }

    return DetailsBox(children: [
      detailsLine('Nome', firstLetterToUpper(pokemon.name)),
      detailsLine('Vida', pokemon.stats.hp.toString()),
      detailsLine('Ataque', pokemon.stats.attack.toString()),
      detailsLine('Defesa', pokemon.stats.defense.toString()),
      detailsLine('Velocidade', pokemon.stats.speed.toString()),
      detailsLine('Ataque especial', pokemon.stats.specialAttack.toString()),
      detailsLine('Defesa especial', pokemon.stats.specialDefense.toString()),
      detailsLine('Altura', '${pokemon.height * 10} cm'),
      detailsLine('Peso', '${pokemon.weight / 10} kg'),
      pokemonTypes(),
    ]);
  }
}
