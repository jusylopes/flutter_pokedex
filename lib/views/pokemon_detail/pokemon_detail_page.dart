import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/icons.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import 'package:pokedex/widgets/pokemon_text_detail.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonModel;
    final backgroundColor =
        PokemonColors().pokeColorBackground(pokemon.types[0].type.name);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              PokemonTextDetail(pokemon: pokemon),
              Padding(
                padding: const EdgeInsets.only(top: 95),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PokemonImage(pokemon: pokemon),
                      PokemonCardData(pokemon: pokemon)
                    ]),
              ),
            ]),
            Container(
              height: 50,
              color: backgroundColor,
              child: TabBar(indicator: _pokeballTabbar(), tabs: const [
                Tab(text: "About"),
                Tab(text: "Stats"),
              ]),
            ),
            Container(
              color: backgroundColor,
              clipBehavior: Clip.none,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Container(
                    color: Colors.white,
                    height: 500,
                    child: TabBarView(children: [
                      _pokemonAbout(pokemon: pokemon),
                      _pokemonAbout(pokemon: pokemon)
                    ]),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  BoxDecoration _pokeballTabbar() {
    return const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(PokemonIcons.pokeballTab),
    ));
  }

  _pokemonAbout({required PokemonModel pokemon}) {
    return Column(
      
    );
  }
}
