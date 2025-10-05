import 'package:flutter/material.dart';
import 'dart:math';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  double pikachuHp = 100;
  double charmanderHp = 100;
  String battleText = "⚔️ Battle Start!";

  void attack(String attacker) {
    setState(() {
      final damage = Random().nextInt(20) + 10; // random 10–30 damage
      if (attacker == "Pikachu") {
        charmanderHp = max(0, charmanderHp - damage);
        battleText = "⚡ Pikachu used Thunderbolt! (-$damage HP)";
      } else {
        pikachuHp = max(0, pikachuHp - damage);
        battleText = "🔥 Charmander used Flamethrower! (-$damage HP)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Pokémon Battle Arena"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pokémon 1 (Pikachu)
          Image.asset('assets/pikacu.jpeg', height: 120),
          LinearProgressIndicator(
            value: pikachuHp / 100,
            color: Colors.yellow,
            backgroundColor: Colors.white24,
          ),
          const SizedBox(height: 20),

          // Pokémon 2 (Charmander)
          Image.asset('assets/pikacu2.jpg', height: 120),
          LinearProgressIndicator(
            value: charmanderHp / 100,
            color: Colors.orange,
            backgroundColor: Colors.white24,
          ),
          const SizedBox(height: 30),

          Text(
            battleText,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Attack Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () => attack("Pikachu"),
                child: const Text("⚡ Pikachu Attack"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () => attack("Charmander"),
                child: const Text("🔥 Charmander Attack"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
