import 'package:book_store_app/data/local_data_source/favorites_local_data_source.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/repository/favorites_repository.dart';

class FavoriteRepositoryImpl extends FavoritesRepository {
  final FavoriteLocalDataSource favoriteLocalDataSource;

  FavoriteRepositoryImpl(this.favoriteLocalDataSource);

  @override
  Future<void> addToFavorites(Book book) {
    return favoriteLocalDataSource.addToFavorites(book);
  }

  @override
  List<Book> getFavorites() {
    return favoriteLocalDataSource.getFavorites();
  }

  @override
  bool isFavorite(String number) {
    return favoriteLocalDataSource.isFavorite(number);
  }

  @override
  Future<void> removeFavorites(String number) {
    return favoriteLocalDataSource.removeFavorites(number);
  }
}
