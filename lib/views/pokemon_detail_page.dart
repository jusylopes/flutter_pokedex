import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon_species/pokemon_species_cubit.dart';
import 'package:pokedex/cubit/pokemon_species/pokemon_species_state.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/widgets/pokemon_about.dart';
import 'package:pokedex/views/widgets/pokemon_card_data.dart';
import 'package:pokedex/views/widgets/pokemon_image.dart';
import 'package:pokedex/views/widgets/pokemon_text_detail.dart';
import 'package:pokedex/views/widgets/reload_button.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  void initState() {
    super.initState();
    _loadPokemonSpecies();
  }

  _loadPokemonSpecies() async {
    context
        .read<PokemonSpeciesCubit>()
        .getPokemonsSpecies(pokemonId: widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemo = widget.pokemon;
    double screenHeight = MediaQuery.of(context).size.height;
    final backgroundColor =
        PokemonColors().pokeColorBackground(pokemo.types[0].type.name);

    return Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                PokemonTextDetail(pokemon: pokemo),
                Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PokemonImage(pokemon: pokemo),
                        PokemonCardData(pokemon: pokemo)
                      ]),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child:
                        BlocBuilder<PokemonSpeciesCubit, PokemonSpeciesState>(
                            builder: (context, state) {
                      if (state is InitialState || state is LoadingState) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: backgroundColor,
                        ));
                      } else if (state is ErrorState) {
                        return Center(
                            child: ReloadButton(
                                maxHeight: screenHeight,
                                onPressed: () {
                                  context
                                      .read<PokemonSpeciesCubit>()
                                      .getPokemonsSpecies(pokemonId: pokemo.id);
                                }));
                      } else if (state is SuccessState) {
                        final pokemonSpecies = state.pokemon;

                        return PokemonAbout(
                          pokemon: pokemo,
                          pokemonSpecies: pokemonSpecies,
                        );
                      }
                      return const Center();
                    }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
