import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/utils/colors.dart';

// class PokemonImage extends StatefulWidget {
//   const PokemonImage({Key? key, required this.pokemon}) : super(key: key);
//   final PokemonModel pokemon;

//   @override
//   State<PokemonImage> createState() => _PokemonImageState();
// }

// class _PokemonImageState extends State<PokemonImage> {
//   bool tapped = false;
//   final duration = const Duration(milliseconds: 300);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: GestureDetector(
//         onTap: () => setState(() => tapped = !tapped),
//         child: AnimatedContainer(
//           duration: duration,
//           child: Image.network(
//             height: 80,
//             tapped
//                 ? widget.pokemon.sprites.backDefault
//                 : widget.pokemon.sprites.frontDefault,
//             fit: BoxFit.cover,
//             filterQuality: FilterQuality.high,
//             loadingBuilder: ((context, child, loadingProgress) {
//               if (loadingProgress == null) {
//                 return child;
//               }
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: PokemonColors()
//
//                  .pokeColorBackground(widget.pokemon.types[0].type.name),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.pokemon}) : super(key: key);
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
        tag: pokemon.id,
        child: CachedNetworkImage(
          height: 80,
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            color:
                PokemonColors().pokeColorBackground(pokemon.types[0].type.name),
          )),
          imageUrl: pokemon.sprites.frontDefault,
        ),
      ),
    );
  }
}
