import 'package:flutter/material.dart';
import 'package:pokedex/views/pokemon_home/pokemon_home_page.dart';

class PokemonSplashPage extends StatefulWidget {
  const PokemonSplashPage({Key? key}) : super(key: key);

  @override
  State<PokemonSplashPage> createState() => _PokemonSplashPageState();
}

class _PokemonSplashPageState extends State<PokemonSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PokemonHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('teste'),
    );
  }
}
