import 'package:hive/hive.dart';

part 'registro_ponto.g.dart';

@HiveType(typeId: 0)
class RegistroPonto {
  @HiveField(0)
  final String data;

  @HiveField(1)
  final String entrada;

  @HiveField(2)
  final String saidaIntervalo;

  @HiveField(3)
  final String retornoIntervalo;

  @HiveField(4)
  final String saida;

  RegistroPonto({
    required this.data,
    this.entrada = '',
    this.saidaIntervalo = '',
    this.retornoIntervalo = '',
    this.saida = '',
  });
}
