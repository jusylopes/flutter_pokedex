import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon_species/pokemon_species_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PokemonCubit(repository: PokemonRepository()),
        ),
        BlocProvider(
          create: (_) => PokemonSpeciesCubit(repository: PokemonRepository()),
        ),
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
