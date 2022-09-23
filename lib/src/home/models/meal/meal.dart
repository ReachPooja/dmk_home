import 'package:dmk_home/src/home/models/ingredient/ingredient.dart';
import 'package:dmk_home/src/home/models/meal_type/meal_type.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Meal extends Equatable {
  const Meal({
    this.id = 0,
    this.name = '',
    this.day = '',
    this.imageUrl = '',
    this.isROTD = 0,
    this.rating = '0',
    this.ratingCount = 0,
    this.mealTypeList = const [],
    this.ingredientsList = const [],
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String day;

  @HiveField(3)
  @JsonKey(name: 'featured_image')
  final String imageUrl;

  @HiveField(4)
  @JsonKey(name: 'is_recipe_of_the_day')
  final int isROTD;

  @HiveField(5)
  @JsonKey(name: 'average_rating')
  final String rating;

  @HiveField(6)
  @JsonKey(name: 'total_rating_count')
  final int ratingCount;

  @HiveField(7)
  @JsonKey(name: 'meal_type')
  final List<MealType> mealTypeList;

  @HiveField(8)
  @JsonKey(name: 'ingredients')
  final List<Ingredient> ingredientsList;

  static const empty = Meal();

  @override
  List<Object> get props {
    return [
      id,
      name,
      day,
      imageUrl,
      isROTD,
      rating,
      ratingCount,
      mealTypeList,
      ingredientsList,
    ];
  }
}
