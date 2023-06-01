class Stats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Stats(this.hp, this.attack, this.defense, this.specialAttack, this.specialDefense, this.speed);

  factory Stats.fromStatList(List<int> stats) {
    return Stats(stats[0], stats[1], stats[2], stats[3], stats[4], stats[5]);
  }
}