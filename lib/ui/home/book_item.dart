import 'package:book_store_app/core/themes/dimens.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/theme.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book, required this.onSelectBook});

  final Book book;
  final void Function(Book book) onSelectBook;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bizarreApprox,
      margin: const EdgeInsets.all(Dimens.padding8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.padding20),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectBook(book);
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  book.cover ?? "",
                  fit: BoxFit.fill,
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
              Padding(
                padding: const EdgeInsets.all(Dimens.padding12),
                child: Text(
                  book.title ?? "",
                  textAlign: TextAlign.center,
                  style: AppThemes.semiBold16.copyWith(
                    color: AppColors.sharkApprox,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
