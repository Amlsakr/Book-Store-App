import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/strings/strings.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/theme.dart';
import '../../data/model/book.dart';
import '../details/book_details.dart';
import '../home/book_item.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoritesViewModelProvide);
    var currentMode = MediaQuery.platformBrightnessOf(context);
    var books = favoriteList.value;
    var content = (books!.isNotEmpty)
        ? ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookItem(
                book: books[index],
                onSelectBook: (Book book) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetails(book: book),
                    ),
                  );
                },
              );
            },
          )
        : Center(
            child: Text(
              Strings.noFavorites,
              style: AppThemes.semiBold18.copyWith(
                color: currentMode == Brightness.light
                    ? AppColors.sharkApprox
                    : Colors.white,
              ),
            ),
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.favoritesBook),
        backgroundColor: AppColors.chestnutRoseApprox,
        foregroundColor: Colors.white,
      ),
      backgroundColor: currentMode == Brightness.light
          ? Colors.white
          : Colors.black,
      body: content,
    );
  }
}
