import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/services/pokemon_repository.dart';
import 'package:pokedex/utils/routes.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:pokedex/views/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex/views/pokemon_home/pokemon_home_page.dart';
import 'package:pokedex/views/pokemon_splash/pokemon_splash_page.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex',
        theme: PokedexTheme.light,
        darkTheme: PokedexTheme.dark,
        initialRoute: Routes.splash,
        routes: {
          Routes.splash: (context) => const PokemonSplashPage(),
          Routes.home: (context) => const PokemonHomePage(),
          Routes.pokemonDetail: (context) => const PokemonDetailPage(),
        },
      ),
    );
  }
}
