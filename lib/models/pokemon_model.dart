class PokemonModel {
  List<Pokemon>? pokemons;

  PokemonModel({this.pokemons});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemons = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemons!.add(Pokemon.fromJson(v));
      });
    }
  }

}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  dynamic candyCount;
  String? egg;
  dynamic spawnChance;
  dynamic avgSpawns;
  String? spawnTime;
  //List<> multipliers;
  List<String>? weaknesses;
  List<PrevEvolution>? prevEvolution;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {this.id,
        this.num,
        this.name,
        this.img,
        this.type,
        this.height,
        this.weight,
        this.candy,
        this.candyCount,
        this.egg,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        //this.multipliers,
        this.weaknesses,
        this.prevEvolution,
        this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'];
    avgSpawns = json['avg_spawns'];
    spawnTime = json['spawn_time'];
    //multipliers = json['multipliers'].cast<double>();
    weaknesses = json['weaknesses'].cast<String>();
    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(PrevEvolution.fromJson(v));
      });
    }
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(new NextEvolution.fromJson(v));
      });
    }
  }

}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}


class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}
