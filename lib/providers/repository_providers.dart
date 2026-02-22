import 'package:book_store_app/data/repositories/auth_repository_impl.dart';
import 'package:book_store_app/data/repositories/home_repository_impl.dart';
import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:book_store_app/domain/repository/home_repository.dart';
import 'package:book_store_app/providers/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepoImpl();
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return HomeRepoImpl(apiService);
});
