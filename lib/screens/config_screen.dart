import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: SingleChildScrollView( // Adicione SingleChildScrollView aqui
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 40), // Espaço entre o AppBar e o contêiner cinza
            // Seção de Perfil
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 300, // Altura ajustada do contêiner cinza
              width: double.infinity, // Largura ajustada do contêiner cinza
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Botão Editar no canto superior direito
                  Positioned(
                    top: 8,
                    right: 8,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'editar',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                  // Conteúdo do perfil centralizado
                  const Center( // Alterado de Column para Center
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Para ocupar apenas o espaço necessário
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/iconeperfil.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'User5596',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center, // Centralizando o texto
                        ),
                        Text(
                          'Biografia',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center, // Centralizando o texto
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Dark Mode Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark mode',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: false,
                  onChanged: (bool value) {},
                  activeColor: Colors.black,
                ),
              ],
            ),
            // Controle de Volume
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Volume',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '100%',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adicione um espaçamento
            // Rodapé com Créditos
            const Text(
              'Aplicativo desenvolvido por:',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              '- Davi Gustavo Barbosa\n'
              '- Matheus Lopes Rodrigues\n'
              '- Bruno Veloso',
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
