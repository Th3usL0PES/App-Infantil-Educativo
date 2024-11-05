import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ciências"),
      ),
      body: const Center(
        child: Text(
          "Conteúdo de Ciências",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
