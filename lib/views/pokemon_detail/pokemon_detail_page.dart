import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});



  @override
  Widget build(BuildContext context) {
     final pokemon = ModalRoute.of(context)!.settings.arguments as PokemonModel;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 40,
          color: PokemonColors().getpokeColor(pokemon.types[0].type.name),
        ),
      ),
    );
  }
}
