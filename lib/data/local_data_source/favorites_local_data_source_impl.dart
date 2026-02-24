import 'package:book_store_app/data/local_data_source/favorites_local_data_source.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  final Box<Book> box;

  FavoriteLocalDataSourceImpl(this.box);

  @override
  Future<void> addToFavorites(Book book) async {
    await box.put(book.title, book);
  }

  @override
  List<Book> getFavorites() {
    return box.values.toList();
  }

  @override
  bool isFavorite(String number) {
    return box.containsKey(number);
  }

  @override
  Future<void> removeFavorites(String number) async {
    await box.delete(number);
  }
}
