import 'package:flutter/material.dart';
import 'package:num_gen_game/view/random_num_gen_game.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomNumGenGame(),
    );
  }
}