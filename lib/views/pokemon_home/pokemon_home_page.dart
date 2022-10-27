import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/text_styles.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/widgets/reload_button.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PokemonHomePage> {
  final List<PokemonModel> pokemonList = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _onScroll();
  }

  void _onScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          !context.read<PokemonCubit>().isLoading) {
        context.read<PokemonCubit>().getPokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Pokédex',
            style: PokemonTextStyles.applicationTitle,
          ),
        ),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          } else if (state is ErrorState) {
            return Center(
                child: ReloadButton(
                    maxHeight: screenHeight,
                    onPressed: () {
                      context.read<PokemonCubit>().getPokemons();
                    }));
          } else if (state is SuccessState) {
            pokemonList.addAll(state.pokemon);
          }
          return PokemonCard(
              scrollController: scrollController, pokemonList: pokemonList);
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
