import 'package:dio/dio.dart';
import 'package:pokedex/client/client_http.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_result_model.dart';
import 'package:pokedex/models/pokemon_species.dart';
import 'package:pokedex/services/pokemons_repository_interface.dart';

class PokemonRepository extends IPokemonRepository {
  PokemonRepository(this._clientHttp);
  final ClientHttp _clientHttp;
  static const _baseApi = 'https://pokeapi.co/api/v2/pokemon';

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    try {
      Response response = await _clientHttp.get('$_baseApi?limit=200');

      final pokemonResultResponse = response.data;
      List<PokemonResultModel> resultPokemon = pokemonResultResponse['results']
          .map<PokemonResultModel>(
              (resultPokemon) => PokemonResultModel.fromJson(resultPokemon))
          .toList();

      final pokemons = <PokemonModel>[];
      for (var pokemon in resultPokemon) {
        pokemons.add(await getPokemon(pokemon.name));
      }

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemon(String name) async {
    try {
      Response response = await _clientHttp.get('$_baseApi/$name');
      final pokemonResponse = response.data;

      return PokemonModel.fromJson(pokemonResponse);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id) async {
    try {
      Response response = await _clientHttp.get('$_baseApi-species/$id');
      final pokemonSpecies = response.data;

      return PokemonSpecies.fromJson(pokemonSpecies);
    } catch (e) {
      rethrow;
    }
  }
}
