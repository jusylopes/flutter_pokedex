import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/text_styles.dart';

class PokemonAboutTab extends StatelessWidget {
  const PokemonAboutTab(
      {super.key, required this.pokemon, required this.backgroundColor});

  final PokemonModel pokemon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle('Pokédex Data', backgroundColor),
          _buildInformationRow('Height', '${pokemon.height / 10} m'),
          _buildInformationRow('Weight', '${pokemon.weight / 10} kg'),
          _buildTitle('Training', backgroundColor),
          _buildInformationRow('Base Exp', '${pokemon.baseExperience}'),
        ],
      ),
    );
  }

  _buildInformationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 95,
            child: Text(label, style: PokemonTextStyles.InformationTitleRow),
          ),
          Text(value, style: PokemonTextStyles.InformationTextRow),
        ],
      ),
    );
  }

  _buildTitle(String title, Color backgroundColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.5),
      child: Text(title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: backgroundColor,
          )),
    );
  }
}
