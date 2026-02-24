import 'package:book_store_app/data/model/book.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addToFavorites(Book book);

  Future<void> removeFavorites(String number);

  bool isFavorite(String number);

  List<Book> getFavorites();
}
