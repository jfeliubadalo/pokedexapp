import 'package:flutter/material.dart';
import 'package:pokedexapp/models/pokemon.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({Key key, @required this.pokemon}) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  Pokemon pokemon;

  @override
  void initState() {
    super.initState();
    this.pokemon = widget.pokemon;
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(pokemon.name,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Text("Heigth: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Types", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(t),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Weakness",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((w) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                w,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Previous Evolution",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          pokemon.previousEvolution != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: pokemon.previousEvolution
                                      .map((n) => FilterChip(
                                            backgroundColor: Colors.green,
                                            label: Text(
                                              n.name,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onSelected: (b) {},
                                          ))
                                      .toList(),
                                )
                              : Text("Does not have evolutions"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Next Evolution",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          pokemon.nextEvolution != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: pokemon.nextEvolution
                                      .map((n) => FilterChip(
                                            backgroundColor: Colors.green,
                                            label: Text(
                                              n.name,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onSelected: (b) {},
                                          ))
                                      .toList(),
                                )
                              : Text("Does not have evolutions"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: pokemon.img,
                  child: Container(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(pokemon.img))),
                  )))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: bodyWidget(context),
    );
  }
}
