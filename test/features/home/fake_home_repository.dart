import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/repository/home_repository.dart';

class FakeHomeRepository implements HomeRepository {
  ApiResponse<List<Book>>? _response;

  void setResponse(ApiResponse<List<Book>> response) {
    _response = response;
  }

  @override
  Future<ApiResponse<List<Book>>> getListOfBooks() async {
    return _response ?? ApiResponse.error("No response set in fake repository");
  }
}
