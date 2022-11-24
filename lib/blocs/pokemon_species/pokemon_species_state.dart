part of 'pokemon_species_bloc.dart';

@immutable
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
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
