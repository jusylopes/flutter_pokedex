import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_result_model.dart';

class PokemonRepository {
  final Dio _dio = Dio();
  static const _baseApi = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<PokemonModel>> getPokemonList() async {
    try {
      Response response = await _dio.get('$_baseApi?limit=700');

      final pokemonResultResponse = response.data;
      List<PokemonResultModel> resultPokemon = pokemonResultResponse['results']
          .map<PokemonResultModel>(
              (resultPokemon) => PokemonResultModel.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in resultPokemon) {
        pokemons.add(await getPokemon(name: pokemon.name));
      }

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonModel> getPokemon({required String name}) async {
    try {
      Response response = await _dio.get('$_baseApi/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }
}
