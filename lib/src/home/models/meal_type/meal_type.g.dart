// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealTypeAdapter extends TypeAdapter<MealType> {
  @override
  final int typeId = 3;

  @override
  MealType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealType(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      imageUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealType obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealType _$MealTypeFromJson(Map<String, dynamic> json) => MealType(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      imageUrl: json['featured_image'] as String? ?? '',
    );

Map<String, dynamic> _$MealTypeToJson(MealType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'featured_image': instance.imageUrl,
    };
