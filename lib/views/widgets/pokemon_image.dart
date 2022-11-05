import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonImage extends StatefulWidget {
  const PokemonImage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonModel pokemon;

  @override
  State<PokemonImage> createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  bool firstChild = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Image.network(
          widget.pokemon.sprites.backDefault,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        secondChild: Image.network(widget.pokemon.sprites.frontDefault,
            fit: BoxFit.cover, filterQuality: FilterQuality.high),
        crossFadeState:
            firstChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 3));
  }
}
