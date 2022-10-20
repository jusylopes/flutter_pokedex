import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/services/pokemon_repository.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({required this.repository}) : super(InitialState()) {
    getPokemons();
  }

  final PokemonRepository repository;

  bool isLoading = false;

  Future<void> getPokemons() async {
    try {
      emit(LoadingState());

      isLoading = true;
      final responsePokemon = await repository.getPokemonList();

      emit(SuccessState(pokemon: responsePokemon));
      isLoading = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}