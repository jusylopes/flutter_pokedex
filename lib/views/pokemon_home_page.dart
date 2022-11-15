import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/text_styles.dart';
import 'package:pokedex/views/widgets/pokemon_card.dart';
import 'package:pokedex/views/widgets/reload_button.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PokemonHomePage> {
  final List<PokemonModel> pokemonList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            'Pokédex',
            style: PokemonTextStyles.applicationTitle,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is InitialState || state is LoadingState) {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
            } else if (state is ErrorState) {
              return Center(
                  child: ReloadButton(
                      maxWidth: maxWidth,
                      onPressed: () {
                        context.read<PokemonCubit>().getPokemons();
                      }));
            } else if (state is SuccessState) {
              pokemonList.addAll(state.pokemon);
            }
            return PokemonCard(
              pokemonList: pokemonList,
              maxWidth: maxWidth,
            );
          },
        );
      }),
    );
  }
}
