import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokemon_repository.dart';
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
    return BlocProvider(
      create: (context) =>
          PokemonBloc(repository: PokemonRepository())..add(LoadPokemonEvent()),
      child: Scaffold(
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

          return BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is InitialState ||
                  state is LoadingState && pokemonList.isEmpty) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
              } else if (state is ErrorState && pokemonList.isEmpty) {
                return Center(
                    child: ReloadButton(
                        errorString: state.error.toString(),
                        maxWidth: maxWidth,
                        onPressed: () {
                          BlocProvider.of<PokemonBloc>(context)
                              .add(LoadPokemonEvent());
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
      ),
    );
  }
}
