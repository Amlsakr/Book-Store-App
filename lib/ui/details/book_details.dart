import 'package:book_store_app/core/strings/strings.dart';
import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/dimens.dart';
import '../../core/themes/theme.dart';
import '../../data/model/book.dart';

class BookDetails extends ConsumerStatefulWidget {
  const BookDetails({super.key, required this.book});

  final Book book;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BookDetails();
  }
}

class _BookDetails extends ConsumerState<BookDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteUseCase = ref.watch(favoritesUseCaseProvider);
    var isFavorite = favoriteUseCase.isFavorite(widget.book.title ?? "");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.chestnutRoseApprox,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              if (isFavorite) {
                await favoriteUseCase.removeFavorites(widget.book.title ?? "");
                setState(() {
                  isFavorite = favoriteUseCase.isFavorite(
                    widget.book.title ?? "",
                  );
                });
              } else {
                await favoriteUseCase.addToFavorites(widget.book);
                setState(() {
                  isFavorite = favoriteUseCase.isFavorite(
                    widget.book.title ?? "",
                  );
                });
              }
            },
            icon: isFavorite
                ? Icon(Icons.bookmark_add, color: Colors.white)
                : Icon(Icons.bookmark_add_outlined, color: Colors.white),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(
                  widget.book.cover ?? "",
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
                widget.book.title ?? "",
                style: AppThemes.semiBold18.copyWith(
                  color: AppColors.sharkApprox,
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
                widget.book.releaseDate ?? "",
                style: AppThemes.medium16.copyWith(
                  color: AppColors.silverChaliceApprox,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                Strings.overview,
                style: AppThemes.semiBold18.copyWith(
                  color: AppColors.sharkApprox,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.book.description ?? "",
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
