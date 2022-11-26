import 'package:flutter/material.dart';

class PokemonColors {
  static const Color gallery = Color(0xFFF0F0F0);

  static const Color bugType = Color(0xFF8CB230);
  static const Color darkType = Color(0xFF58575F);
  static const Color dragonType = Color(0xFF0F6AC0);
  static const Color electricType = Color(0xFFEED535);
  static const Color fairyType = Color(0xFFED6EC7);
  static const Color fightingType = Color(0xFFD04164);
  static const Color fireType = Color(0xFFFD7D24);
  static const Color flyingType = Color(0xFF748FC9);
  static const Color ghostType = Color(0xFF556AAE);
  static const Color grassType = Color(0xFF62B957);
  static const Color groundType = Color(0xFFDD7748);
  static const Color iceType = Color(0xFF61CEC0);
  static const Color normalType = Color(0xFF9DA0AA);
  static const Color poisonType = Color(0xFFA552CC);
  static const Color psychicType = Color(0xFFEA5D60);
  static const Color rockType = Color(0xFFBAAB82);
  static const Color steelType = Color(0xFF417D9A);
  static const Color waterType = Color(0xFF4A90DA);

  static const Color bugBackground = Color(0xFF8BD674);
  static const Color darkBackground = Color(0xFF6F6E78);
  static const Color dragonBackground = Color(0xFF7383B9);
  static const Color electricBackground = Color(0xFFF2CB55);
  static const Color fairyBackground = Color(0xFFEBA8C3);
  static const Color fightingBackground = Color(0xFFEB4971);
  static const Color fireBackground = Color(0xFFFFA756);
  static const Color flyingBackground = Color(0xFF83A2E3);
  static const Color ghostBackground = Color(0xFF8571BE);
  static const Color grassBackground = Color(0xFF8BBE8A);
  static const Color groundBackground = Color(0xFFF78551);
  static const Color iceBackground = Color(0xFF91D8DF);
  static const Color normalBackground = Color(0xFFB5B9C4);
  static const Color poisonBackground = Color(0xFFB5B9C4);
  static const Color psychicBackground = Color(0xFFFF6468);
  static const Color rockBackground = Color(0xFFD4C294);
  static const Color steelBackground = Color(0xFF4C91B2);
  static const Color waterBackground = Color(0xFF58ABF6);

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
