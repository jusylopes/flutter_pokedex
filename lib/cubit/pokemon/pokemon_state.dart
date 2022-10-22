import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_model.dart';


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
  @override
  List<Object> get props => [];
}
