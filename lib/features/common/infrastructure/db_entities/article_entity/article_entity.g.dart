// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleEntityAdapter extends TypeAdapter<ArticleEntity> {
  @override
  final int typeId = 0;

  @override
  ArticleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleEntity(
      id: fields[0] as String,
      sourceName: fields[1] as String,
      author: fields[2] as String?,
      title: fields[3] as String,
      description: fields[4] as String?,
      url: fields[5] as String,
      imageUrl: fields[6] as String?,
      publishedAt: fields[7] as String,
      content: fields[8] as String?,
      isFavourite: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sourceName)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.publishedAt)
      ..writeByte(8)
      ..write(obj.content)
      ..writeByte(9)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
