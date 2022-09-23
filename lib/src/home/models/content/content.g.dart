// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentAdapter extends TypeAdapter<Content> {
  @override
  final int typeId = 1;

  @override
  Content read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Content(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      isArticle: fields[3] as int,
      pages: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Content obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.isArticle)
      ..writeByte(4)
      ..write(obj.pages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      imageUrl: json['featured_image'] as String? ?? '',
      isArticle: json['is_article'] as int? ?? 0,
      pages: json['total_pages'] as int? ?? 0,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'featured_image': instance.imageUrl,
      'is_article': instance.isArticle,
      'total_pages': instance.pages,
    };
