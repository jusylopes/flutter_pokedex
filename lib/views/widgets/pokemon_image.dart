import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

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
          imageUrl: pokemon.sprites.frontDefault,
          imageBuilder: (context, imageProvider) => Container(
            alignment: Alignment.topRight,
            height: 150,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
          // placeholder: (context, url) => Container(
          //   alignment: Alignment.center,
          //   child: const CircularProgressIndicator(),
          // ),
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
