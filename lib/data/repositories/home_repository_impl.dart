import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/core/utils/utils.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/data/services/api_service.dart';
import 'package:book_store_app/domain/repository/home_repository.dart';

import '../../core/strings/strings.dart';

class HomeRepoImpl extends HomeRepository {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<ApiResponse<List<Book>>> getListOfBooks() async {
    var isConnected = await Utils.isConnected();
    if (isConnected) {
      try {
        final books = await apiService.getBooks();
        return ApiResponse.success(books);
      } catch (e) {
        throw Exception(Strings.serverError);
      }
    } else {
      throw Exception(Strings.noInternetConnection);
    }
  }
}
