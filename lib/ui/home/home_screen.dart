import 'package:book_store_app/core/strings/strings.dart';
import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:book_store_app/ui/details/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/theme.dart';
import '../../data/model/book.dart';
import '../favorites/favorites_screen.dart';
import 'book_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeStatus = ref.watch(homeViewModelProvider);
    var currentMode = MediaQuery.platformBrightnessOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appBarTitle),
        backgroundColor: AppColors.chestnutRoseApprox,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
            icon: const Icon(Icons.bookmark_add, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: currentMode == Brightness.light
          ? Colors.white
          : Colors.black,
      body: homeStatus.when(
        data: (books) {
          if (books.data != null) {
            return ListView.builder(
              itemCount: books.data?.length,
              itemBuilder: (context, index) {
                return BookItem(
                  book: books.data![index],
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
            );
          }
        },
        error: (err, stack) => Center(
          child: Text(
            "$err",
            style: AppThemes.semiBold18.copyWith(
              color: currentMode == Brightness.light
                  ? AppColors.sharkApprox
                  : Colors.white,
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.chestnutRoseApprox),
        ),
      ),
    );
  }
}
