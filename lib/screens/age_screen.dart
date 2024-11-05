import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'home_screen.dart'; // Certifique-se de importar o arquivo correto

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double valueSlider = 0;
  bool isAgeSelected = false; // Controle para saber se a idade foi selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4d4c61),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título
            const Text(
              "Selecione sua Idade",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial', // Substitua por uma fonte que você preferir
              ),
            ),
            const SizedBox(height: 20), // Espaço entre o título e a árvore

            // Árvore
            SizedBox(
              height: 300, // Ajuste a altura se necessário
              child: RiveAnimation.asset(
                "assets/tree_demo.riv", // Certifique-se de que este é o nome correto do arquivo
                fit: BoxFit.contain,
                onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                    artboard,
                    "State Machine 1", // Confirme se esse é o nome correto da máquina de estado
                  );

                  if (controller != null) {
                    artboard.addController(controller!);
                    inputValue = controller?.findInput("input"); // Verifique se este é o nome correto da entrada
                    inputValue?.change(valueSlider); // Muda a entrada de acordo com o slider
                  }
                },
              ),
            ),

            const SizedBox(height: 20), // Espaço entre a árvore e a barra de deslizar

            // Slider
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.green.withOpacity(0.5),
              value: valueSlider,
              onChanged: (v) {
                setState(() {
                  valueSlider = v;
                  isAgeSelected = valueSlider > 0; // Define se a idade foi selecionada
                });
                inputValue?.change(v);
              },
              min: 0,
              max: 100,
            ),

            const SizedBox(height: 20), // Espaço entre o slider e o texto

            // Número do Slider
            Text(
              valueSlider.toStringAsFixed(0), // Exibe o valor do slider
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20), // Espaço entre o número e o botão

            // Botão Continuar
            ElevatedButton(
              onPressed: isAgeSelected ? () {
                // Navega para a HomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Removido 'const'
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Continuar"),
            ),
          ],
        ),
      ),
    );
  }
}
