import 'dart:async';

import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/use_cases/favorites/favorites_use_case.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesViewModel extends AsyncNotifier<List<Book>> {
  late FavoritesUseCase favoritesUseCase;

  @override
  FutureOr<List<Book>> build() {
    favoritesUseCase = ref.watch(favoritesUseCaseProvider);
    return favoritesUseCase.getFavorites();
  }

  List<Book> getFavoritesList() {
    return favoritesUseCase.getFavorites();
  }
}
