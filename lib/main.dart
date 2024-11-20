import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'tela_inicial.dart'; // Importando a TelaInicial
import 'tela_manual.dart'; // Importando a TelaManual

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Ponto',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaPrincipal(), // Alterando para a TelaPrincipal com PageView
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _currentIndex = 0; // Para controlar o índice da tela
  final PageController _pageController = PageController(); // Controlador para o PageView

  // Função para navegar pelas telas usando o índice
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index); // Navega para a página selecionada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controle de Ponto')),
      body: PageView(
        controller: _pageController, // Controlador para navegação por deslize
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          TelaInicial(), // Tela inicial
          TelaManual(), // Tela manual
          Container(color: Colors.grey), // Placeholder para outras telas
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice da página atual
        onTap: _onItemTapped, // Método que é chamado quando o ícone da barra é pressionado
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Manual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Tabela',
          ),
        ],
      ),
    );
  }
}
