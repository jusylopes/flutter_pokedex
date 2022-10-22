import 'package:flutter/material.dart';

class PokemonColors {
  static const gallery = Color(0xFFF0F0F0);

  static const bugType = Color(0xFF8CB230);
  static const darkType = Color(0xFF58575F);
  static const dragonType = Color(0xFF0F6AC0);
  static const electricType = Color(0xFFEED535);
  static const fairyType = Color(0xFFED6EC7);
  static const fightingType = Color(0xFFD04164);
  static const fireType = Color(0xFFFD7D24);
  static const flyingType = Color(0xFF748FC9);
  static const ghostType = Color(0xFF556AAE);
  static const grassType = Color(0xFF62B957);
  static const groundType = Color(0xFFDD7748);
  static const iceType = Color(0xFF61CEC0);
  static const normalType = Color(0xFF9DA0AA);
  static const poisonType = Color(0xFFA552CC);
  static const psychicType = Color(0xFFEA5D60);
  static const rockType = Color(0xFFBAAB82);
  static const steelType = Color(0xFF417D9A);
  static const waterType = Color(0xFF4A90DA);

  static const bugBackground = Color(0xFF8BD674);
  static const darkBackground = Color(0xFF6F6E78);
  static const dragonBackground = Color(0xFF7383B9);
  static const electricBackground = Color(0xFFF2CB55);
  static const fairyBackground = Color(0xFFEBA8C3);
  static const fightingBackground = Color(0xFFEB4971);
  static const fireBackground = Color(0xFFFFA756);
  static const flyingBackground = Color(0xFF83A2E3);
  static const ghostBackground = Color(0xFF8571BE);
  static const grassBackground = Color(0xFF8BBE8A);
  static const groundBackground = Color(0xFFF78551);
  static const iceBackground = Color(0xFF91D8DF);
  static const normalBackground = Color(0xFFB5B9C4);
  static const poisonBackground = Color(0xFFB5B9C4);
  static const psychicBackground = Color(0xFFFF6468);
  static const rockBackground = Color(0xFFD4C294);
  static const steelBackground = Color(0xFF4C91B2);
  static const waterBackground = Color(0xFF58ABF6);

  Color getpokeColor(type) {
    switch (type) {
      case 'normal':
        return PokemonColors.normalType;
      case 'fighting':
        return PokemonColors.fightingType;
      case 'flying':
        return PokemonColors.flyingType;
      case 'poison':
        return PokemonColors.poisonType;
      case 'ground':
        return PokemonColors.groundType;
      case 'rock':
        return PokemonColors.rockType;
      case 'bug':
        return PokemonColors.bugType;
      case 'ghost':
        return PokemonColors.ghostType;
      case 'steel':
        return PokemonColors.steelType;
      case 'fire':
        return PokemonColors.fireType;
      case 'water':
        return PokemonColors.waterType;
      case 'grass':
        return PokemonColors.grassType;
      case 'electric':
        return PokemonColors.electricType;
      case 'psychic':
        return PokemonColors.psychicType;
      case 'ice':
        return PokemonColors.iceType;
      case 'dragon':
        return PokemonColors.dragonType;
      case 'dark':
        return PokemonColors.darkType;
      case 'fairy':
        return PokemonColors.fairyType;
      default:
        return PokemonColors.normalType;
    }
  }

  Color pokeColorBackground(type) {
    switch (type) {
      case 'normal':
        return PokemonColors.normalBackground;
      case 'fighting':
        return PokemonColors.fightingBackground;
      case 'flying':
        return PokemonColors.flyingBackground;
      case 'poison':
        return PokemonColors.poisonBackground;
      case 'ground':
        return PokemonColors.groundBackground;
      case 'rock':
        return PokemonColors.rockBackground;
      case 'bug':
        return PokemonColors.bugBackground;
      case 'ghost':
        return PokemonColors.ghostBackground;
      case 'steel':
        return PokemonColors.steelBackground;
      case 'fire':
        return PokemonColors.fireBackground;
      case 'water':
        return PokemonColors.waterBackground;
      case 'grass':
        return PokemonColors.grassBackground;
      case 'electric':
        return PokemonColors.electricBackground;
      case 'psychic':
        return PokemonColors.psychicBackground;
      case 'ice':
        return PokemonColors.iceBackground;
      case 'dragon':
        return PokemonColors.dragonBackground;
      case 'dark':
        return PokemonColors.darkBackground;
      case 'fairy':
        return PokemonColors.fairyBackground;
      default:
        return PokemonColors.normalBackground;
    }
  }
}
