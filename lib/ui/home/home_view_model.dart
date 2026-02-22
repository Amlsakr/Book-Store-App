import 'dart:async';

import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<ApiResponse<List<Book>>> {
  @override
  FutureOr<ApiResponse<List<Book>>> build() async {
    final homeUseCase = ref.read(homeUseCaseProvider);
    return await homeUseCase.execute();
  }

  Future<void> getListOfBooks() async {
    final homeUseCase = ref.read(homeUseCaseProvider);
    state = const AsyncLoading();
    try {
      final response = await homeUseCase.execute();
      if (response.isSuccess) {
        state = AsyncData(response);
      } else {
        state = AsyncError(response.error!, StackTrace.current);
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
