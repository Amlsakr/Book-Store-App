import 'package:book_store_app/data/repositories/auth_repository_impl.dart';
import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return Authrepositoryimpl();
});
