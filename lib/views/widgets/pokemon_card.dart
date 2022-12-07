import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/views/pokemon_detail_page.dart';
import 'package:pokedex/views/widgets/pokeball.dart';
import 'package:pokedex/views/widgets/pokemon_card_data.dart';
import 'package:pokedex/views/widgets/pokemon_image.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonList,
    required this.maxWidth,
  }) : super(key: key);

  final List<PokemonModel> pokemonList;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: maxWidth < 600 ? 1 : maxWidth ~/ 200,
              mainAxisExtent: 150),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];

            return Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailPage(
                        pokemon: pokemon,
                      ),
                    ),
                  );
                },
                splashColor: PokemonColors.normalType,
                child: Ink(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: PokemonColors()
                          .pokeColorBackground(pokemon.types[0].type.name),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        const Pokeball(),
                        PokemonImage(pokemon: pokemon),
                        PokemonCardData(pokemon: pokemon),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
