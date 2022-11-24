import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_species.dart';
import 'package:pokedex/services/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_species_event.dart';
part 'pokemon_species_state.dart';

class PokemonSpeciesBloc
    extends Bloc<PokemonSpeciesEvent, PokemonSpeciesState> {
  final PokemonRepository repository;

  PokemonSpeciesBloc({required this.repository}) : super(InitialState()) {
    on<LoadPokemonSpeciesEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final PokemonSpecies responsePokemon =
            await repository.getPokemonSpecies(event.id);
        emit(SuccessState(pokemon: responsePokemon));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
