import 'package:book_store_app/core/utils/utils.dart';
import 'package:book_store_app/data/local_data_source/favorites_local_data_source.dart';
import 'package:book_store_app/data/local_data_source/favorites_local_data_source_impl.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final favoritesBoxProvider = Provider<Box<Book>>((ref) {
  return Hive.box<Book>(Utils.bookStoreHiveBox);
});

final favoritesLocalDataSourceProvider = Provider<FavoriteLocalDataSource>((
  ref,
) {
  final box = ref.read(favoritesBoxProvider);
  return FavoriteLocalDataSourceImpl(box);
});
