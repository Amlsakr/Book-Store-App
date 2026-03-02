import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/repository/home_repository.dart';
import 'package:book_store_app/domain/use_cases/home/home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  test('should return success when fake repo returns success', () async {
    MockHomeRepository mockHomeRepository = MockHomeRepository();
    HomeUseCase homeUseCase = HomeUseCase(mockHomeRepository);
    final books = [Book(title: 'test', releaseDate: 'Jun 26,1997')];
    when(
      mockHomeRepository.getListOfBooks(),
    ).thenAnswer((_) async => ApiResponse.success(books));

    final result = await homeUseCase.execute();
    expect(result.isSuccess, true);
    expect(result.data?.length, 1);
  });
}
