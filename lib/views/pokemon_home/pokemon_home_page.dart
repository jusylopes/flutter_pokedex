import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

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
    return Scaffold(
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Center(child: Text('erro'));
          } else if (state is SuccessState) {
            pokemonList.addAll(state.pokemon);
          }
          return Scrollbar(
            child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                controller: scrollController,
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];

                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color:
                          PokemonColors().pokeColorBackground(pokemon.types[0].type.name),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '# ${_transformPokemonId(pokemon.id)}',
                              textAlign: TextAlign.left,
                              style: const TextStyle(),
                            ),
                            Image.network(
                              pokemon.sprites.frontDefault,
                              filterQuality: FilterQuality.high,
                            ),
                            Text(
                              _capitalize(pokemon.name),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // child: Stack(
                    //   alignment: Alignment.topCenter,
                    //   children: [
                    //     Container(
                    //       margin: const EdgeInsets.only(top: 25),
                    //       decoration: BoxDecoration(
                    //         color: PokemonColors()
                    //             .pokeColorBackground(pokemon.types[0]),
                    //         borderRadius: BorderRadius.circular(10.0),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             blurRadius: 20,
                    //             color: PokemonColors()
                    //                 .pokeColorBackground(pokemon.types[0])
                    //                 .withOpacity(0.5),
                    //             offset: const Offset(0, 10),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
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

  _capitalize(pokemonName) =>
      "${pokemonName[0].toUpperCase()}${pokemonName.substring(1)}";

  String _transformPokemonId(int pokemonId) {
    return pokemonId < 10
        ? '00$pokemonId'
        : pokemonId < 100
            ? '0$pokemonId'
            : pokemonId.toString();
  }
}
