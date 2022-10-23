import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/cubit/pokemon/pokemon_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/icons.dart';
import 'package:pokedex/utils/text_styles.dart';
import 'package:pokedex/widgets/pokeball.dart';
import 'package:pokedex/widgets/pokemon_card_pattern.dart';
import 'package:pokedex/widgets/pokemon_image.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                controller: scrollController,
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];

                  return GestureDetector(
                    onTap: () {},
                    child: Stack(alignment: Alignment.centerRight, children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '# ${_transformPokemonId(pokemon.id)}',
                                textAlign: TextAlign.left,
                                style: PokemonTextStyles.pokemonNumber,
                              ),
                              Text(
                                _capitalize(pokemon.name),
                                style: PokemonTextStyles.pokemonName,
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: pokemon.types
                                    .map(
                                      (Type type) => SizedBox(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                              color: PokemonColors()
                                                  .getpokeColor(type.type.name),
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: SvgPicture.asset(
                                                  'assets/poke_types/${type.type.name}.svg',
                                                  width: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Text(
                                                  _capitalize(type.type.name),
                                                  style: PokemonTextStyles
                                                      .pokemonType,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const PokemonCardPattern(),
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

