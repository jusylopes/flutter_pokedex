import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon_species/pokemon_species_state.dart';
import 'package:pokedex/models/pokemon_species.dart';
import 'package:pokedex/services/pokemon_repository.dart';

class PokemonSpeciesCubit extends Cubit<PokemonSpeciesState> {
  PokemonSpeciesCubit({required this.repository}) : super(InitialState());

  final PokemonRepository repository;

  Future<void> getPokemonsSpecies({required int pokemonId}) async {
    try {
      emit(LoadingState());

      final PokemonSpecies responsePokemon =
          await repository.getPokemonSpecies(pokemonId);

      emit(SuccessState(pokemon: responsePokemon));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
