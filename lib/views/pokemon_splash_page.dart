import 'package:flutter/material.dart';
import 'package:pokedex/utils/icons.dart';
import 'package:pokedex/views/pokemon_home_page.dart';

class PokemonSplashPage extends StatefulWidget {
  const PokemonSplashPage({Key? key}) : super(key: key);

  @override
  State<PokemonSplashPage> createState() => _PokemonSplashPageState();
}

class _PokemonSplashPageState extends State<PokemonSplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PokemonHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 2.0).animate(_controller),
            child: Container(
              height: maxWidth / 6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(PokemonIcons.pokeballIcon),
                      fit: BoxFit.fitHeight)),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
