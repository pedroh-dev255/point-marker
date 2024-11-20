import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importando intl para formatação de data e hora

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _horarioController = TextEditingController();
  bool _isButtonDisabled = false; // Variável para desabilitar o botão por 15 minutos

  @override
  void initState() {
    super.initState();
    // Preenche o horário com o horário atual no formato HH:mm
    _horarioController.text = DateFormat('HH:mm').format(DateTime.now());
  }

  void _registrarHorario() {
    // Lógica para salvar o horário (simulação de registro)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Horário Registrado"),
          content: Text("Horário ${_horarioController.text} foi salvo!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );

    // Desabilitar o botão por 15 minutos
    setState(() {
      _isButtonDisabled = true;
    });

    Future.delayed(Duration(minutes: 15), () {
      setState(() {
        _isButtonDisabled = false; // Habilitar o botão após 15 minutos
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Ponto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _horarioController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Horário',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Torna o campo somente leitura
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonDisabled ? null : _registrarHorario,
              child: Text(
                'Registrar Ponto',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
