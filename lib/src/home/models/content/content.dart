import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Content extends Equatable {
  const Content({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
    this.isArticle = 0,
    this.pages = 0,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'featured_image')
  final String imageUrl;

  @HiveField(3)
  @JsonKey(name: 'is_article')
  final int isArticle;

  @HiveField(4)
  @JsonKey(name: 'total_pages')
  final int pages;

  static const empty = Content();

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      isArticle,
      pages,
    ];
  }
}
