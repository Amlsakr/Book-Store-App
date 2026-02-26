import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/domain/use_cases/home/home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_home_repository.dart';

void main() {
  test('should return success when fake repo returns success', () async {
    FakeHomeRepository fakeHomeRepository = FakeHomeRepository();
    HomeUseCase homeUseCase = HomeUseCase(fakeHomeRepository);
    final books = [Book(title: 'test', releaseDate: 'Jun 26,1997')];
    fakeHomeRepository.setResponse(ApiResponse.success(books));
    final result = await homeUseCase.execute();

    expect(result.isSuccess, true);
    expect(result.data?.length, 1);
  });
}
