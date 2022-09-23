import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_type.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class MealType extends Equatable {
  const MealType({
    this.id = 0,
    this.name = '',
    this.slug = '',
    this.imageUrl = '',
  });

  factory MealType.fromJson(Map<String, dynamic> json) =>
      _$MealTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MealTypeToJson(this);

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String slug;

  @HiveField(3)
  @JsonKey(name: 'featured_image')
  final String imageUrl;

  @override
  List<Object> get props => [id, name, slug, imageUrl];
}
