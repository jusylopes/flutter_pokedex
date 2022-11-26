class PokemonSpecies {
  PokemonSpecies({
    required this.baseHappiness,
    required this.captureRate,
    required this.growthRate,
    required this.flavorTextEntries,
    required this.id,
    required this.name,
  });

  final int baseHappiness;
  final int captureRate;
  final List<FlavorTextEntry> flavorTextEntries;
  final Color growthRate;
  final int id;
  final String name;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        growthRate: Color.fromJson(json["growth_rate"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );
}

class Color {
  Color({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  final String flavorText;
  final Color language;
  final Color version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromJson(json["language"]),
        version: Color.fromJson(json["version"]),
      );
}
