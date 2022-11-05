import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_species.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonModel> getPokemon(String name);
  Future<PokemonSpecies> getPokemonSpecies(int id);
}
