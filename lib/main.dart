import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/services/pokemon_repository.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:pokedex/views/pokemon_home/pokemon_home_page.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: PokedexTheme.light,
      darkTheme: PokedexTheme.dark,
      home: BlocProvider<PokemonCubit>(
        create: (context) => PokemonCubit(repository: PokemonRepository()),
        child: const PokemonHomePage(),
      ),
    );
  }
}
