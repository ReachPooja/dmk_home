// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 2;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      id: fields[0] as int,
      name: fields[1] as String,
      day: fields[2] as String,
      imageUrl: fields[3] as String,
      isROTD: fields[4] as int,
      rating: fields[5] as int,
      ratingCount: fields[6] as int,
      mealTypeList: (fields[7] as List).cast<MealType>(),
      ingredientsList: (fields[8] as List).cast<Ingredients>(),
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.isROTD)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.ratingCount)
      ..writeByte(7)
      ..write(obj.mealTypeList)
      ..writeByte(8)
      ..write(obj.ingredientsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      day: json['day'] as String? ?? '',
      imageUrl: json['featured_image'] as String? ?? '',
      isROTD: json['is_recipe_of_the_day'] as int? ?? 0,
      rating: json['average_rating'] as int? ?? 0,
      ratingCount: json['total_rating_count'] as int? ?? 0,
      mealTypeList: (json['meal_type'] as List<dynamic>?)
              ?.map((e) => MealType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ingredientsList: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'day': instance.day,
      'featured_image': instance.imageUrl,
      'is_recipe_of_the_day': instance.isROTD,
      'average_rating': instance.rating,
      'total_rating_count': instance.ratingCount,
      'meal_type': instance.mealTypeList,
      'ingredients': instance.ingredientsList,
    };
