import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
        tag: pokemon.id,
        child: CachedNetworkImage(
          height: 80,
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            color:
                PokemonColors().pokeColorBackground(pokemon.types[0].type.name),
          )),
          imageUrl: pokemon.sprites.frontDefault,
        ),
      ),
    );
  }
}
