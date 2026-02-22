import '../../core/data/api_response.dart';
import '../../data/model/book.dart';

abstract class HomeRepository {
  Future<ApiResponse<List<Book>>> getListOfBooks();
}
