import 'package:flutter/material.dart';
import 'package:pokedex/utils/icons.dart';
import 'package:pokedex/utils/routes.dart';

class PokemonSplashPage extends StatefulWidget {
  const PokemonSplashPage({Key? key}) : super(key: key);

  @override
  State<PokemonSplashPage> createState() => _PokemonSplashPageState();
}

class _PokemonSplashPageState extends State<PokemonSplashPage>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 2.0).animate(controller),
          child: Container(
            height: screenHeight / 5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(PokemonIcons.pokeballIcon),
                    fit: BoxFit.fitHeight)),
          ),
        ),
      ),
    );
  }
}
