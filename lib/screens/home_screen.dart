import 'package:flutter/material.dart';
import 'package:rive/rive.dart'; // Importa o pacote Rive
import '../widgets/bottom_nav_bar.dart';
import 'math_screen.dart';
import 'portuguese_screen.dart';
import 'science_screen.dart';
import 'art_screen.dart';
import 'login_screen.dart'; // Importar a tela de login

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprender'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()), // Navega para a tela de login
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fundo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os itens
            children: [
              const Text(
                "Destaque",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Card de destaque para Matemática (maior)
              _buildMathCard(context),
              const SizedBox(height: 30),
              const Text(
                "Outras Tarefas",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Cards para outras tarefas centralizados
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza os cards horizontalmente
                children: [
                  Column(
                    children: [
                      _buildSubjectCard(
                        context,
                        backgroundImage: 'assets/images/fundosea.png',
                        subject: "Português",
                        screen: PortugueseScreen(),
                        size: const Size(325, 104), // Tamanho ajustado para outras tarefas
                        titleFontSize: 15, // Tamanho da fonte para Português
                      ),
                      const SizedBox(height: 8),
                      _buildSubjectCard(
                        context,
                        backgroundImage: 'assets/images/fundofloresta.png',
                        subject: "Ciências",
                        screen: ScienceScreen(),
                        size: const Size(325, 104), // Tamanho ajustado para outras tarefas
                        titleFontSize: 15, // Tamanho da fonte para Ciências
                      ),
                      const SizedBox(height: 8),
                      // Card de Artes modificado para incluir o GIF diretamente
                      Container(
                        width: 325,
                        height: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/fundoutono.gif'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row( // Altera para Row para colocar o GIF e o texto lado a lado
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaçamento entre os elementos
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Artes",
                                    style: TextStyle(
                                      color: Colors.white, // Cor do texto
                                      fontSize: 15, // Tamanho da fonte para Artes
                                      fontWeight: FontWeight.bold, // Texto em negrito
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 96, // Largura do botão
                                    height: 27, // Altura do botão
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ArtScreen()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        padding: EdgeInsets.zero, // Remove o padding para manter o tamanho
                                        elevation: 5, // Sombra do botão
                                      ),
                                      child: Text(
                                        "Aprender", // Texto do botão alterado
                                        style: TextStyle(fontSize: 12), // Tamanho do texto do botão reduzido
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Ajusta a posição do twig.gif para o canto direito
                              const SizedBox(width: 10), // Adiciona um espaço entre o texto e o twig.gif
                              Image.asset(
                                'assets/images/twig.gif', // Caminho para o GIF
                                width: 120, // Tamanho do GIF ajustado para algo visível
                                height: 120, // Tamanho do GIF ajustado para algo visível
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildMathCard(BuildContext context) {
    return Container(
      width: 325,
      height: 199,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/fundoselva.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row( // Altera para Row para colocar a animação ao lado
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Matemática",
                  style: TextStyle(
                    color: Colors.white, // Cor do texto
                    fontSize: 20, // Tamanho da fonte para Matemática
                    fontWeight: FontWeight.bold, // Texto em negrito
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 96, // Largura do botão
                  height: 27, // Altura do botão
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MathScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.zero, // Remove o padding para manter o tamanho
                      elevation: 5, // Sombra do botão
                    ),
                    child: Text(
                      "Aprender", // Texto do botão alterado
                      style: TextStyle(fontSize: 12), // Tamanho do texto do botão reduzido
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16), // Espaço entre o texto e a animação
            const SizedBox(
              width: 100, // Largura do espaço da animação
              height: 100, // Altura do espaço da animação
              child: RiveAnimation.asset(
                'assets/rabbit.riv', // Caminho para o arquivo .riv
                fit: BoxFit.cover, // Ajuste a animação ao espaço
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(
    BuildContext context, {
    required String backgroundImage,
    required String subject,
    required Widget screen,
    required Size size,
    required double titleFontSize, // Parâmetro para o tamanho da fonte do título
  }) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subject,
              style: TextStyle(
                color: Colors.white, // Cor do texto
                fontSize: titleFontSize, // Usando o tamanho da fonte do parâmetro
                fontWeight: FontWeight.bold, // Texto em negrito
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 96, // Largura do botão
              height: 27, // Altura do botão
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.zero, // Remove o padding para manter o tamanho
                  elevation: 5, // Sombra do botão
                ),
                child: Text(
                  "Aprender", // Texto do botão alterado
                  style: TextStyle(fontSize: 12), // Tamanho do texto do botão reduzido
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
