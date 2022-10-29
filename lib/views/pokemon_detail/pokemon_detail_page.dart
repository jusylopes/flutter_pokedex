import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';
import 'package:pokedex/widgets/pokemon_image.dart';
import 'package:pokedex/widgets/pokemon_text_detail.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonModel;
    double screenHeight = MediaQuery.of(context).size.height;
    final backgroundColor =
        PokemonColors().pokeColorBackground(pokemon.types[0].type.name);
    const int defaulTabController = 2;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: backgroundColor,
            child: Stack(children: [
              PokemonTextDetail(pokemon: pokemon),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PokemonImage(pokemon: pokemon),
                      PokemonCardData(pokemon: pokemon)
                    ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
