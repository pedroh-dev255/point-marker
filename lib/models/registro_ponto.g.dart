// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_ponto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistroPontoAdapter extends TypeAdapter<RegistroPonto> {
  @override
  final int typeId = 0;

  @override
  RegistroPonto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistroPonto(
      data: fields[0] as String,
      entrada: fields[1] as String,
      saidaIntervalo: fields[2] as String,
      retornoIntervalo: fields[3] as String,
      saida: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegistroPonto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.entrada)
      ..writeByte(2)
      ..write(obj.saidaIntervalo)
      ..writeByte(3)
      ..write(obj.retornoIntervalo)
      ..writeByte(4)
      ..write(obj.saida);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistroPontoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
