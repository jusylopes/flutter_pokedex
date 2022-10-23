import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/utils/icons.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(top: 20),
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
            child: SvgPicture.asset(
              PokemonIcons.pokeball,
              fit: BoxFit.fitWidth,
              height: 145,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
