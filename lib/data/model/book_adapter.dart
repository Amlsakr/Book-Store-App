import 'package:book_store_app/data/model/book.dart';
import 'package:hive_flutter/adapters.dart';

class BookAdapter extends TypeAdapter<Book> {
  @override
  Book read(BinaryReader reader) {
    final number = reader.readInt();
    final title = reader.readString();
    final originalTitle = reader.readString();
    final releaseDate = reader.readString();
    final description = reader.readString();
    final pages = reader.readInt();
    final cover = reader.readString();
    final index = reader.readInt();

    return Book(
      number: number,
      title: title,
      originalTitle: originalTitle,
      releaseDate: releaseDate,
      description: description,
      pages: pages,
      cover: cover,
      index: index,
    );
  }

  @override
  final int typeId = 1;

  @override
  void write(BinaryWriter writer, Book obj) {
    writer.writeInt(obj.number ?? 0);
    writer.writeString(obj.title ?? "");
    writer.writeString(obj.originalTitle ?? "");
    writer.writeString(obj.releaseDate ?? "");
    writer.writeString(obj.description ?? "");
    writer.writeInt(obj.pages ?? 0);
    writer.writeString(obj.cover ?? "");
    writer.writeInt(obj.index ?? 0);
  }
}
