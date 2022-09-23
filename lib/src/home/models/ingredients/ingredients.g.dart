// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientsAdapter extends TypeAdapter<Ingredients> {
  @override
  final int typeId = 4;

  @override
  Ingredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredients(
      quantity: fields[0] as String,
      name: fields[1] as String,
      unit: fields[2] as String,
      prefix: fields[3] as String,
      servingId: fields[4] as int,
      productId: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredients obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.unit)
      ..writeByte(3)
      ..write(obj.prefix)
      ..writeByte(4)
      ..write(obj.servingId)
      ..writeByte(5)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      quantity: json['quantity'] as String? ?? '',
      name: json['name'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      prefix: json['recipe_prefix'] as String? ?? '',
      servingId: json['serving_id'] as int? ?? 0,
      productId: json['product_id'] as int? ?? 0,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'name': instance.name,
      'unit': instance.unit,
      'recipe_prefix': instance.prefix,
      'serving_id': instance.servingId,
      'product_id': instance.productId,
    };
