import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';
import 'package:pokedex/utils/text_styles.dart';

class PokemonCardData extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCardData({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '# ${_transformPokemonId(pokemon.id)}',
            textAlign: TextAlign.left,
            style: PokemonTextStyles.pokemonNumber,
          ),
          Text(
            _capitalize(pokemon.name),
            style: PokemonTextStyles.pokemonName,
            maxLines: 1,
          ),
          const SizedBox(height: 5.0),
          Row(
            children: pokemon.types
                .map(
                  (Type type) => Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 25.0,
                    decoration: BoxDecoration(
                        color: PokemonColors().getpokeColor(type.type.name),
                        borderRadius: BorderRadius.circular(4.0)),
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/poke_types/${type.type.name}.svg',
                            width: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            _capitalize(type.type.name),
                            style: PokemonTextStyles.pokemonType,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  _capitalize(pokemonName) =>
      "${pokemonName[0].toUpperCase()}${pokemonName.substring(1)}";

  String _transformPokemonId(int pokemonId) {
    return pokemonId < 10
        ? '00$pokemonId'
        : pokemonId < 100
            ? '0$pokemonId'
            : pokemonId.toString();
  }
}
