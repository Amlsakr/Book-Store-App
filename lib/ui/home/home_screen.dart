import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/book.dart';
import 'book_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeStatus = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"),
        backgroundColor: AppColors.chestnutRoseApprox,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: homeStatus.when(
        data: (books) {
          if (books.data != null) {
            return ListView.builder(
              itemCount: books.data?.length,
              itemBuilder: (context, index) {
                return BookItem(
                  book: books.data![index],
                  onSelectBook: (Book book) {},
                );
              },
            );
          }
        },
        error: (err, stack) => Center(child: Text("$err")),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.chestnutRoseApprox),
        ),
      ),
    );
  }
}
