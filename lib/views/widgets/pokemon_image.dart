import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.pokemon, required this.heightImage}) : super(key: key);
  final PokemonModel pokemon;
  final double heightImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
        tag: pokemon.id,
        child: CachedNetworkImage(
          height: heightImage,
          fit: BoxFit.fitHeight,
          imageUrl: pokemon.sprites.frontDefault,
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            color: PokemonColors().getpokeColor(pokemon.types[0].type.name),
          )),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
