import 'package:flutter/material.dart';
import 'package:pokedexapp/screens/home_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pokedex",
        home: HomeScreen(),
      ),
    );
