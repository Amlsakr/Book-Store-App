import 'dart:async';

import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/use_cases/favorites/favorites_use_case.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesViewModel extends Notifier<List<Book>> {
  late FavoritesUseCase favoritesUseCase;

  @override
  List<Book> build() {
    favoritesUseCase = ref.watch(favoritesUseCaseProvider);
    return favoritesUseCase.getFavorites();
  }

  List<Book> getFavoritesList() {
    return favoritesUseCase.getFavorites();
  }

  void toggleFavorite(Book book) async {
    final isFav = isFavorite(book.title ?? "");

    if (isFav) {
      await favoritesUseCase.removeFavorites(book.title ?? "");
    } else {
      await favoritesUseCase.addToFavorites(book);
    }

    state = favoritesUseCase.getFavorites(); // trigger rebuild
  }

  bool isFavorite(String title) {
    return state.any((b) => b.title == title);
  }
}
