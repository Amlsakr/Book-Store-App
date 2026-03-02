import 'package:book_store_app/core/strings/strings.dart';
import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/dimens.dart';
import '../../core/themes/theme.dart';
import '../../data/model/book.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesViewModelProvide);
    final viewModel = ref.read(favoritesViewModelProvide.notifier);
    var isFavorite = favorites.any((b) => b.title == book.title);
    var currentMode = MediaQuery.platformBrightnessOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.chestnutRoseApprox,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.toggleFavorite(book);
            },
            icon: isFavorite
                ? Icon(Icons.bookmark_add, color: Colors.white)
                : Icon(Icons.bookmark_add_outlined, color: Colors.white),
          ),
        ],
      ),

      backgroundColor: currentMode == Brightness.light
          ? Colors.white
          : Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.padding8),
              child: Center(
                child: Image.network(
                  book.cover ?? "",
                  fit: BoxFit.cover,
                  height: Dimens.imageHeight,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      height: Dimens.imageHeight,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.chestnutRoseApprox,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: Dimens.imageHeight,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Text(
                book.title ?? "",
                style: AppThemes.semiBold18.copyWith(
                  color: currentMode == Brightness.light
                      ? AppColors.sharkApprox
                      : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                Strings.harryBotter,
                style: AppThemes.medium16.copyWith(
                  color: AppColors.silverChaliceApprox,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                book.releaseDate ?? "",
                style: AppThemes.medium16.copyWith(
                  color: AppColors.silverChaliceApprox,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.padding8,
                right: Dimens.padding8,
              ),
              child: Text(
                Strings.overview,
                style: AppThemes.semiBold18.copyWith(
                  color: currentMode == Brightness.light
                      ? AppColors.sharkApprox
                      : Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.padding8),
              child: Text(
                book.description ?? "",
                style: AppThemes.regular14.copyWith(
                  color: AppColors.silverChaliceApprox,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
