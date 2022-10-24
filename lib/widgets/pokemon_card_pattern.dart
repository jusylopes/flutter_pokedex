import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/icons.dart';

class PokemonCardPattern extends StatelessWidget {
  const PokemonCardPattern({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.lerp(
        Alignment.topLeft,
        Alignment.topCenter,
        0.7,
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: SvgPicture.asset(
          PokemonIcons.pattern,
          height: 32.0,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
