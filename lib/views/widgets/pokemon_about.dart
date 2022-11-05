import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_species.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/text_styles.dart';

class PokemonAbout extends StatelessWidget {
  const PokemonAbout(
      {super.key, required this.pokemon, required this.pokemonSpecies});

  final PokemonModel pokemon;
  final PokemonSpecies pokemonSpecies;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        PokemonColors().pokeColorBackground(pokemon.types[0].type.name);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
              pokemonSpecies.flavorTextEntries
                  .where((e) => e.language.name == 'en')
                  .toList()
                  .sublist(0, 1)
                  .map((e) => e.flavorText)
                  .join(' ')
                  .replaceAll("\n", ' '),
              textAlign: TextAlign.justify,
              style: PokemonTextStyles.aboutPokemon),
        ),
        _buildTitle('Pokédex Data', backgroundColor),
        _buildInformationRow('Height', '${pokemon.height / 10} m'),
        _buildInformationRow('Weight', '${pokemon.weight / 10} kg'),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              const SizedBox(
                width: 130,
                child: Text('Abilities',
                    style: PokemonTextStyles.informationTitleRow),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.abilities
                    .map((ability) => Text(
                          '${capitalize(ability.ability.name)} ',
                          style: PokemonTextStyles.informationTextRow,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        _buildInformationRow('Weight', '${pokemon.weight / 10} kg'),
        _buildTitle('Training', backgroundColor),
        _buildInformationRow('Catch Rate', '${pokemonSpecies.captureRate}'),
        _buildInformationRow(
            'Base Happiness', '${pokemonSpecies.baseHappiness}'),
        _buildInformationRow('Base Exp', '${pokemon.baseExperience}'),
        _buildInformationRow('Growth Rate', pokemonSpecies.growthRate.name),
      ],
    );
  }

  _buildInformationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: PokemonTextStyles.informationTitleRow),
          ),
          Text(capitalize(value), style: PokemonTextStyles.informationTextRow),
        ],
      ),
    );
  }

  _buildTitle(String title, backgroundColor) {
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

  String capitalize(pokemonText) =>
      "${pokemonText[0].toUpperCase()}${pokemonText.substring(1)}";
}
