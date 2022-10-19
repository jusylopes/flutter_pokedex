class PokemonResultModel {
  PokemonResultModel({required this.name, required this.url});

  final String name;
  final String url;

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      PokemonResultModel(
        name: json['name'],
        url: json['url'],
      );
}
