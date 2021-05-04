import 'package:flutter/material.dart';

import 'package:pokedexapp/models/pokemon.dart';

class PokemonHeroComponent extends StatelessWidget {
  final Pokemon poke;

  PokemonHeroComponent({this.poke});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: poke.img,
      child: Card(
        elevation: 3.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(poke.img),
                ),
              ),
            ),
            Text(
              poke.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
