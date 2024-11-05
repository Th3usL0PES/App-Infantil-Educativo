import 'package:flutter/material.dart';
// Importe a tela MathExerciseScreen
import 'mathexerc_screen.dart';
// Importe a tela de Subtração
import 'subtracaoexrc_screen.dart';
// Importe a tela de Multiplicação
import 'multiexerc.dart';
// Importe a tela de Divisão
import 'divexerc.dart'; // Importe a tela de exercícios de divisão

class MathScreen extends StatelessWidget {
  const MathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercícios')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SubjectTile(
            backgroundImage: 'assets/images/adição.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MathExerciseScreen(), // Navega para a tela MathExerciseScreen
                ),
              );
            },
          ),
          SubjectTile(
            backgroundImage: 'assets/images/subtração.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubtracaoExerciseScreen(), // Navega para a tela de Subtração
                ),
              );
            },
          ),
          SubjectTile(
            backgroundImage: 'assets/images/multiplicação.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MultExerciseScreen(), // Navega para a tela de Multiplicação
                ),
              );
            },
          ),
          SubjectTile(
            backgroundImage: 'assets/images/divisão.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DivisaoExerciseScreen(), // Navega para a tela de Divisão
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final String backgroundImage;
  final VoidCallback onTap;

  const SubjectTile({super.key, 
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 357,
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ExerciseScreen extends StatelessWidget {
  final String title;

  const ExerciseScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Exercício de $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
