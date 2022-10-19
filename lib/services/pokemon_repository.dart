import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_result_model.dart';

class PokemonRepository {
  final Dio _dio = Dio();

  Future<List<PokemonResultModel>> getPokemonList() async {
    try {
      Response response =
          await _dio.get('https://pokeapi.co/api/v2/pokemon?limit=250');

      final pokemonResultResponse = response.data;
      List<PokemonResultModel> resultPokemon = pokemonResultResponse['results']
          .map<PokemonResultModel>(
              (resultPokemon) => PokemonResultModel.fromJson(resultPokemon))
          .toList();

      print(response.data);

      return resultPokemon;
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonModel> getPokemon({required String name}) async {
    try {
      Response response =
          await _dio.get('https://pokeapi.co/api/v2/pokemon/$name');

      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }
}
