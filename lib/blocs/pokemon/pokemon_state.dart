part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {}

class InitialState extends PokemonState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class SuccessState extends PokemonState {
  SuccessState({required this.pokemon});
  final List<PokemonModel> pokemon;

  @override
  List<Object> get props => [pokemon];
}

class ErrorState extends PokemonState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
