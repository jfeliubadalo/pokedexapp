import 'package:flutter/material.dart';

import 'package:pokedexapp/components/pokemon_hero.dart';
import 'package:pokedexapp/models/pokemon.dart';
import 'package:pokedexapp/screens/pokemon_screen.dart';
import 'package:pokedexapp/services/pokemon_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  PokeHub pokehub;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    PokemonService.fetchPokemons().then((data) {
      setState(() {
        pokehub = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex App"),
        backgroundColor: Colors.red,
      ),
      body: pokehub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: GridView.count(
                crossAxisCount: 2,
                children: pokehub.pokemon
                    .map((poke) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PokemonDetailScreen(pokemon: poke),
                                ),
                              );
                            },
                            child: PokemonHeroComponent(
                              poke: poke,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchData(),
        backgroundColor: Colors.red,
        child: Icon(Icons.filter_list),
      ),
    );
  }
}
