import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<ApiResponse<List<Book>>> execute() async {
    var a = await _homeRepository.getListOfBooks();

    return a;
  }
}
