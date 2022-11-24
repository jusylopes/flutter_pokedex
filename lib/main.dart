import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/services/pokemon_repository.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:pokedex/views/pokemon_splash_page.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonRepository = PokemonRepository(Dio());

    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
            create: (_) => PokemonBloc(repository: pokemonRepository)
              ..add(LoadPokemonEvent())),
        // BlocProvider<PokemonSpeciesBloc>(
        //     create: (_) => PokemonSpeciesBloc(repository: pokemonRepository)
        //       ..add( LoadPokemonSpeciesEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex',
        theme: PokedexTheme.light,
        home: const PokemonSplashPage(),
      ),
    );
  }
}
