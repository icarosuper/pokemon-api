import 'dart:convert';

import 'package:litedex/model/stats.dart';

class Pokemon {
  final int id;
  final String name;
  final String image;
  final int height;
  final int weight;
  final Stats stats;
  final List<String> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.height,
    required this.stats,
    required this.types,
    required this.weight,
    });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final statList = List<int>.from(json['stats'].map((stat) => stat['base_stat']));
    final typesList = List<String>.from(json['types'].map((item) => item['type']['name']));

    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['dream_world']['front_default'],
      height: json['height'],
      weight: json['weight'],
      stats: Stats.fromStatList(statList),
      types: typesList,
    );
  }
}


