import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/text_styles.dart';
import 'package:pokedex/widgets/pokeball.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
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
        title: const Text(
          'Pokedex',
          style: PokemonTextStyles.applicationTitle,
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
          return Scrollbar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];

                  return GestureDetector(
                    onTap: () {},
                    child: Stack(alignment: Alignment.centerRight, children: [
                      Container(
                        height: 130,
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: PokemonColors()
                              .pokeColorBackground(pokemon.types[0].type.name),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: PokemonColors()
                                  .pokeColorBackground(
                                      pokemon.types[0].type.name)
                                  .withOpacity(0.4),
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: PokemonCardData(pokemon: pokemon)),
                      ),
                      const Pokeball(),
                      PokemonImage(pokemon: pokemon),
                    ]),
                  );
                },
              ),
            ),
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
}
