import 'package:flutter/material.dart';

class RandomNumGenGame extends StatefulWidget {
  const RandomNumGenGame({super.key});

  @override
  State<RandomNumGenGame> createState() => _RandomNumGenGameState();
}

class _RandomNumGenGameState extends State<RandomNumGenGame> {
  int? first, second;
  int correct = 0;
  int incorrect = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    first =
        (1 + (100 * (DateTime.now().millisecondsSinceEpoch % 100) / 100))
            .toInt();
    second =
        (1 + (100 * (DateTime.now().millisecondsSinceEpoch % 100) / 100))
            .toInt();

    if (first == second) {
      generateRandomNumber();
      return;
    }

    setState(() {});
  }

  void buttonPressed(int selected) {
    if (gameOver) {
      return;
    }

    int greater = first! > second! ? first! : second!;

    if (selected == greater) {
      correct++;
    } else {
      incorrect++;
    }

    if (correct + incorrect >= 10) {
      gameOver = true;
      setState(() {});
    } else {
      generateRandomNumber();
    }
  }

  void resetGame() {
    correct = 0;
    incorrect = 0;
    gameOver = false;
    generateRandomNumber();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator Game'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: gameOver ? null : () => buttonPressed(first!),
                      child: Text(first.toString()),
                    ),
                  ),
                  SizedBox(width: 70),
                  SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: gameOver ? null : () => buttonPressed(second!),
                      child: Text(second.toString()),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Correct: $correct",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Incorrect: $incorrect",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (gameOver) ...[
                    Text(
                      'Game Over!',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: resetGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Play Again',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
