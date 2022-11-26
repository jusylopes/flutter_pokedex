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
        InformationTitle(
          title: 'Pokédex Data',
          colorTitle: backgroundColor,
        ),
        InformationRow(
          label: 'Height',
          value: '${pokemon.height / 10} m',
        ),
        InformationRow(
          label: 'Weight',
          value: '${pokemon.weight / 10} kg',
        ),
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
                          '${(ability.ability.name)} ',
                          style: PokemonTextStyles.informationTextRow,
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        InformationRow(
          label: 'Weight',
          value: '${pokemon.weight / 10} kg',
        ),
        InformationTitle(
          title: 'Training',
          colorTitle: backgroundColor,
        ),
        InformationRow(
          label: 'Catch Rate',
          value: '${pokemonSpecies.captureRate}',
        ),
        InformationRow(
          label: 'Base Happiness',
          value: '${pokemonSpecies.baseHappiness}',
        ),
        InformationRow(
          label: 'Base Exp',
          value: '${pokemon.baseExperience}',
        ),
        InformationRow(
          label: 'Growth Rate',
          value: pokemonSpecies.growthRate.name,
        ),
      ],
    );
  }
}

class InformationRow extends StatelessWidget {
  const InformationRow({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: PokemonTextStyles.informationTitleRow,
            ),
          ),
          Text(
            value,
            style: PokemonTextStyles.informationTextRow,
          ),
        ],
      ),
    );
  }
}

class InformationTitle extends StatelessWidget {
  const InformationTitle(
      {super.key, required this.title, required this.colorTitle});
  final String title;
  final colorTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.5),
      child: Text(title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: colorTitle,
          )),
    );
  }
}
