import 'dart:math';

import 'package:amazing_app/drawer.dart';
import 'package:flutter/material.dart';

 int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }


class GuessTheNumberGame extends StatefulWidget {
  const GuessTheNumberGame({super.key});

  @override
  State<GuessTheNumberGame> createState() => _GuessTheNumberGameState();
}

class _GuessTheNumberGameState extends State<GuessTheNumberGame> {
  final numberInputController = TextEditingController();
  int randomNumber = random(0, 101);
  bool won = false;
  bool lost = false;
  int triesLeft = 5;

  @override
  Widget build(BuildContext context) {
    if (won) {
      return Scaffold(
        appBar: AppBar(title: const Text('You won'),),
        drawer: const Drawer(child: DrawerContent(),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You won!'),
              Text('The number was $randomNumber')
            ],
          ),
        ),
      );
    } 
    else if (lost) {
      return Scaffold(
        appBar: AppBar(title: const Text('You lost'),),
        drawer: const Drawer(child: DrawerContent(),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You lost'),
              Text('The number was $randomNumber')
            ],
          ),
        ),
      );
    }
    else {
      return Scaffold(
      appBar: AppBar(title: const Text("Guess the Number Game"),),
      drawer: const Drawer(child: DrawerContent(),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Guess the number game'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 400),
            child: TextField(
              controller: numberInputController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Enter a number'
              ),
            ),
          ),
          Text("Tries left: $triesLeft"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: () {
              if (triesLeft == 0) {
                const snackBar = SnackBar(content: Text('You lost'));
                setState(() {
                  lost = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else if (int.parse(numberInputController.text) == randomNumber) {
                const snackBar = SnackBar(content: Text('You won!'));
                setState(() {
                  triesLeft -= 1;
                  won = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else if (int.parse(numberInputController.text) < randomNumber) {
                const snackBar = SnackBar(content: Text('Try a bigger number'));
                setState(() {
                  triesLeft -= 1;
                  if (triesLeft == 0) {
                    lost = true;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else if (int.parse(numberInputController.text) > randomNumber) {
                const snackBar = SnackBar(content: Text('Try a smaller number'));
                setState(() {
                  triesLeft -= 1;
                   if (triesLeft == 0) {
                    lost = true;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, child: const Text('Enter')),
          ),
        ],
      ),
    );
    }
    
  }
}