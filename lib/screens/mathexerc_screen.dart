import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:math';

class MathExerciseScreen extends StatefulWidget {
  const MathExerciseScreen({super.key});

  @override
  _MathExerciseScreenState createState() => _MathExerciseScreenState();
}

class _MathExerciseScreenState extends State<MathExerciseScreen> {
  int _currentQuestionIndex = 0;
  int _firstNumber = 0;
  int _secondNumber = 0;
  late List<int> _options;
  late int _correctAnswer;

  SMITrigger? _correctTrigger;
  SMITrigger? _incorrectTrigger;
  StateMachineController? controller;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  // Carrega o arquivo Rive e configura os triggers das animações
  void _onRiveInit(Artboard artboard) {
    var controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
      _correctTrigger = controller.findSMI('Correct') as SMITrigger?;
      _incorrectTrigger = controller.findSMI('Incorrect') as SMITrigger?;
      this.controller = controller; // Corrigido: armazenar o controller
    }
  }

  void _generateQuestion() {
    final random = Random();
    _firstNumber = random.nextInt(50);
    _secondNumber = random.nextInt(50);
    _correctAnswer = _firstNumber + _secondNumber;

    _options = List<int>.generate(4, (index) {
      if (index == 0) return _correctAnswer;
      return random.nextInt(100);
    })..shuffle();
  }

  void _checkAnswer(int selectedAnswer) {
    final isCorrect = selectedAnswer == _correctAnswer;
    if (isCorrect) {
      _correctTrigger?.fire();
      _showFeedbackDialog('Muito bem!', 'Você acertou a resposta!');
    } else {
      _incorrectTrigger?.fire();
      _showFeedbackDialog('Tente novamente', 'Resposta incorreta, tente outra vez.');
    }
  }

  void _showFeedbackDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: Text(content),
        backgroundColor: Colors.blue.shade800,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nextQuestion();
            },
            child: const Text('Ok', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < 4) {
        _currentQuestionIndex++;
        _generateQuestion();
      } else {
        _currentQuestionIndex = 0;
        _showEndDialog();
      }
    });
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Parabéns!', style: TextStyle(color: Colors.white)),
        content: const Text('Você completou todas as perguntas de Adição!'),
        backgroundColor: Colors.blue.shade800,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Volta para a tela anterior
            },
            child: const Text('Voltar', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentQuestionIndex = 0;
                _generateQuestion();
              });
            },
            child: const Text('Continuar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo alterada para branco
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Exercício de Adição'),
      ),
      body: SingleChildScrollView( // Adicionado para permitir rolagem
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centralizado
            children: [
              SizedBox(
                height: 200,
                child: RiveAnimation.asset(
                  'assets/bear.riv',
                  fit: BoxFit.contain,
                  onInit: _onRiveInit,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Qual é o resultado da soma desses dois números:',
                style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold), // Alterada a cor do texto para preto
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberBox(_firstNumber),
                  const Text(' + ', style: TextStyle(fontSize: 36, color: Colors.black)), // Alterada a cor do texto para preto
                  _buildNumberBox(_secondNumber),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: _options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => _checkAnswer(option),
                      child: Text(
                        option.toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberBox(int number) {
    return Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
