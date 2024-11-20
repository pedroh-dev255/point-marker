import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TelaManual extends StatefulWidget {
  @override
  _TelaManualState createState() => _TelaManualState();
}

class _TelaManualState extends State<TelaManual> {
  DateTime _dataSelecionada = DateTime.now();
  final Map<String, String> _horarios = {};

  final TextEditingController _entradaController = TextEditingController();
  final TextEditingController _saidaIntervaloController = TextEditingController();
  final TextEditingController _retornoIntervaloController = TextEditingController();
  final TextEditingController _saidaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _entradaController.text = "08:00";
    _saidaIntervaloController.text = "12:00";
    _retornoIntervaloController.text = "13:00";
    _saidaController.text = "17:00";
  }

  Future<void> _selecionarData() async {
    final DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (dataEscolhida != null && dataEscolhida != _dataSelecionada) {
      setState(() {
        _dataSelecionada = dataEscolhida;
      });
    }
  }

  void _salvarHorario() {
    final String dataFormatada = DateFormat('dd/MM/yyyy').format(_dataSelecionada);

    setState(() {
      _horarios[dataFormatada] = '${_entradaController.text} - ${_saidaIntervaloController.text} - ${_retornoIntervaloController.text} - ${_saidaController.text}';
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Horário salvo para ${dataFormatada}")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro Manual')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _selecionarData,
              child: Text('Selecionar Data: ${DateFormat('dd/MM/yyyy').format(_dataSelecionada)}'),
            ),
            TextField(controller: _entradaController, decoration: InputDecoration(labelText: 'Entrada'), keyboardType: TextInputType.datetime),
            TextField(controller: _saidaIntervaloController, decoration: InputDecoration(labelText: 'Saída para Intervalo'), keyboardType: TextInputType.datetime),
            TextField(controller: _retornoIntervaloController, decoration: InputDecoration(labelText: 'Retorno do Intervalo'), keyboardType: TextInputType.datetime),
            TextField(controller: _saidaController, decoration: InputDecoration(labelText: 'Saída'), keyboardType: TextInputType.datetime),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _salvarHorario, child: Text('Salvar Horário')),
            SizedBox(height: 20),
            Text('Horários Registrados:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: _horarios.length,
                itemBuilder: (context, index) {
                  String data = _horarios.keys.elementAt(index);
                  return ListTile(title: Text(data), subtitle: Text(_horarios[data]!));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
