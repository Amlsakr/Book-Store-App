import 'package:book_store_app/domain/repository/favorites_repository.dart';

import '../../../data/model/book.dart';

class FavoritesUseCase {
  final FavoritesRepository favoritesRepository;

  FavoritesUseCase(this.favoritesRepository);

  Future<void> addToFavorites(Book book) async {
    return await favoritesRepository.addToFavorites(book);
  }

  Future<void> removeFavorites(String number) =>
      favoritesRepository.removeFavorites(number);

  bool isFavorite(String number) => favoritesRepository.isFavorite(number);

  List<Book> getFavorites() {
    return favoritesRepository.getFavorites();
  }
}
