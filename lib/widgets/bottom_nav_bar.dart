import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/config_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/book.png', // Caminho para o ícone de Aprender
            width: 24, // Largura do ícone
            height: 24, // Altura do ícone
          ),
          label: 'Aprender',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/perfil.png', // Caminho para o ícone de Eu
            width: 24, // Largura do ícone
            height: 24, // Altura do ícone
          ),
          label: 'Eu',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ConfigScreen()));
        }
      },
    );
  }
}
