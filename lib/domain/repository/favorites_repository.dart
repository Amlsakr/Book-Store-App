import 'dart:ffi';

import '../../data/model/book.dart';

abstract class FavoritesRepository {
  Future<void> addToFavorites(Book book);

  Future<void> removeFavorites(String number);

  bool isFavorite(String number);

  List<Book> getFavorites();
}
