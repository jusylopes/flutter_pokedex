import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_species.dart';


abstract class PokemonSpeciesState extends Equatable {}

class InitialState extends PokemonSpeciesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PokemonSpeciesState {
  @override
  List<Object> get props => [];
}

class SuccessState extends PokemonSpeciesState {
  SuccessState({required this.pokemon});
  final PokemonSpecies pokemon;

  @override
  List<Object> get props => [pokemon];
}

class ErrorState extends PokemonSpeciesState {
  @override
  List<Object> get props => [];
}
