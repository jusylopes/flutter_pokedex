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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: maxWidth < 600 ? 2 : maxWidth ~/ 200,
          childAspectRatio: 1.4,
        ),
        itemCount: pokemonList.length,
     
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailPage(pokemon: pokemon)),
                );
              },
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: PokemonColors()
                      .pokeColorBackground(pokemon.types[0].type.name),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: PokemonColors()
                          .pokeColorBackground(pokemon.types[0].type.name)
                          .withOpacity(0.4),
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Pokeball(),
                    PokemonImage(pokemon: pokemon),
                    PokemonCardData(pokemon: pokemon),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
