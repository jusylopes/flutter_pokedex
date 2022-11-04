class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.abilities,
    required this.baseExperience,
    required this.gameIndices,
  });

  final int id;
  final String name;
  final int height;
  final int weight;
  final List<Type> types;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Ability> abilities;
  final int baseExperience;
  final List<GameIndex> gameIndices;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name: json["name"],
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );
}

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species ability;
  final bool isHidden;
  final int slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final Species version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
      );
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );
}
