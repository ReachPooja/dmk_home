import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class Ingredient extends Equatable {
  const Ingredient({
    this.quantity = '',
    this.name = '',
    this.unit = '',
    this.prefix = '',
    this.servingId = 0,
    this.productId = 0,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  @HiveField(0)
  final String quantity;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String unit;

  @HiveField(3)
  @JsonKey(name: 'recipe_prefix')
  final String prefix;

  @HiveField(4)
  @JsonKey(name: 'serving_id')
  final int servingId;

  @HiveField(5)
  @JsonKey(name: 'product_id')
  final int productId;

  @override
  List<Object> get props {
    return [
      quantity,
      name,
      unit,
      prefix,
      servingId,
      productId,
    ];
  }
}
