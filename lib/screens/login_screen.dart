import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'age_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late StateMachineController _stateMachineController;
  late SMIBool _dogWalkCycle;
  late SMIBool _dogWalkCycleOor;
  late SMIBool _dogWalkCycleStaart;
  late SMIBool _dogWalkCycleTong;

  void _onInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );

    if (controller != null) {
      artboard.addController(controller);
      _stateMachineController = controller;

      _dogWalkCycle = _stateMachineController.findInput<bool>('dog-walk-cycle') as SMIBool;
      _dogWalkCycleOor = _stateMachineController.findInput<bool>('dog-walk-cycle Oor') as SMIBool;
      _dogWalkCycleStaart = _stateMachineController.findInput<bool>('dog-walk-cycle Staart') as SMIBool;
      _dogWalkCycleTong = _stateMachineController.findInput<bool>('dog-walk-cycle Tong') as SMIBool;

      _dogWalkCycle.value = true;
    } else {
      print('State Machine "State Machine 1" não encontrada no Artboard.');
    }
  }

  void _mouseEnterOor() {
    _dogWalkCycle.value = false;
    _dogWalkCycleOor.value = true;
  }

  void _mouseLeaveOor() {
    _dogWalkCycleOor.value = false;
    _dogWalkCycle.value = true;
  }

  void _mouseEnterStaart() {
    _dogWalkCycle.value = false;
    _dogWalkCycleStaart.value = true;
  }

  void _mouseLeaveStaart() {
    _dogWalkCycleStaart.value = false;
    _dogWalkCycle.value = true;
  }

  void _mouseEnterTong() {
    _dogWalkCycle.value = false;
    _dogWalkCycleTong.value = true;
  }

  void _mouseLeaveTong() {
    _dogWalkCycleTong.value = false;
    _dogWalkCycle.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF646AC3), 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Stack(
                children: [
                  // Container da animação do cachorro (fundo)
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: RiveAnimation.asset(
                      'assets/dog.riv', 
                      fit: BoxFit.contain,
                      onInit: _onInit,
                    ),
                  ),
                  // Livros à esquerda
                  Positioned(
                    left: 10, // Ajuste conforme necessário
                    bottom: 100, // Ajuste conforme necessário para que fique em cima da animação
                    child: Image.asset(
                      'assets/images/books1.png', // Caminho do primeiro livro
                      height: 100, // Ajuste a altura conforme necessário
                    ),
                  ),
                  // Livros à direita
                  Positioned(
                    right: 10, // Ajuste conforme necessário
                    bottom: 100, // Ajuste conforme necessário para que fique em cima da animação
                    child: Image.asset(
                      'assets/images/books2.png', // Caminho do segundo livro
                      height: 100, // Ajuste a altura conforme necessário
                    ),
                  ),
                  // Coloque aqui os outros widgets, como o formulário de login
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 220), // Para empurrar os campos de entrada para baixo da animação
                      Image.asset(
                        'assets/images/title.png',
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: 'Nome'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AgeScreen()),
                          );
                        },
                        child: const Text('Entrar'),
                      ),
                      // MouseRegions para detectar hover nas partes da animação
                      MouseRegion(
                        onEnter: (_) => _mouseEnterOor(),
                        onExit: (_) => _mouseLeaveOor(),
                        child: Container(
                          width: 50, // Ajuste para o tamanho da área da orelha
                          height: 50, // Ajuste para o tamanho da área da orelha
                          alignment: Alignment.topLeft, // Posicione onde a orelha está na animação
                          color: Colors.transparent,
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => _mouseEnterStaart(),
                        onExit: (_) => _mouseLeaveStaart(),
                        child: Container(
                          width: 50, // Ajuste para o tamanho da área do rabo
                          height: 50, // Ajuste para o tamanho da área do rabo
                          alignment: Alignment.bottomRight, // Posicione onde o rabo está na animação
                          color: Colors.transparent,
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => _mouseEnterTong(),
                        onExit: (_) => _mouseLeaveTong(),
                        child: Container(
                          width: 50, // Ajuste para o tamanho da área da língua
                          height: 50, // Ajuste para o tamanho da área da língua
                          alignment: Alignment.center, // Posicione onde a língua está na animação
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
