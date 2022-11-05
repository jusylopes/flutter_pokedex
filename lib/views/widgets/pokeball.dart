import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:pokedex/utils/icons.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: ClipRect(
        child: Align(
          alignment: Alignment.centerLeft,
          heightFactor: 0.85,
          widthFactor: 0.86,
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
            child: const Image(
              image: Svg(
                PokemonIcons.pokeball
              ),
              fit: BoxFit.fitWidth,
              height: 150,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
