import 'package:flutter/material.dart';
import 'package:litedex/components/pokemon_details.dart';
import 'package:litedex/model/pokemon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;
  
  const PokemonInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: SvgPicture.network(
                  pokemon.image,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${pokemon.id}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "#${pokemon.name}",
                      style: const TextStyle(
                        fontSize: 64.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

}