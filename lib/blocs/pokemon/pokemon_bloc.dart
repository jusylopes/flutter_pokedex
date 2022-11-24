import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokemon_repository.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;
  List<PokemonModel> pokemonList = [];


  PokemonBloc({required this.repository}) : super(InitialState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(LoadingState());    
      print('loading');

      try {
        pokemonList = await repository.getPokemonList();       
        emit(SuccessState(pokemon: pokemonList));     
       
      } catch (e) {       
        emit(ErrorState(e.toString()));
      }
    });
  }
}
