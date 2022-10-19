import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_result_model.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PopularMovie();
}

class _PopularMovie extends State<PokemonHomePage> {
  final List<PokemonResultModel> pokemons = [];
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
    return Scaffold(
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Center(child: Text('erro'));
          } else if (state is SuccessState) {
            pokemons.addAll(state.pokemon);
          }
          return Scrollbar(
            child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                controller: scrollController,
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final int pokemonId = index + 1;

                  return GestureDetector(
                    onTap: () {},
                    child: GridTile(
                      header: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png',
                        fit: BoxFit.cover,
                      ),
                      footer: Text(
                       _capitalize (pokemons[index].name),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: const SizedBox(),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  _capitalize(pokemonName) => "${pokemonName[0].toUpperCase()}${pokemonName.substring(1)}";

  String _transformPokemonId(int pokemonId) {
    return pokemonId < 10
        ? '00$pokemonId'
        : pokemonId < 100
            ? '0$pokemonId'
            : pokemonId.toString();
  }
}
