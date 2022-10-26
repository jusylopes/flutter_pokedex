import 'package:flutter/material.dart';
import 'package:pokedex/utils/routes.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('teste'),
    );
  }
}
