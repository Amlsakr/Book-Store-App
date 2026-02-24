import 'package:book_store_app/domain/use_cases/auth/login_use_case.dart';
import 'package:book_store_app/domain/use_cases/auth/signup_use_case.dart';
import 'package:book_store_app/domain/use_cases/favorites/favorites_use_case.dart';
import 'package:book_store_app/domain/use_cases/home/home_use_case.dart';
import 'package:book_store_app/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/use_cases/auth/get_auth_state_use_case.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});
final signUpUseCaseProvider = Provider<SignupUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignupUseCase(repository);
});
final getAuthUseCaseStateProvider = Provider<GetAuthStateUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetAuthStateUseCase(repository);
});
final homeUseCaseProvider = Provider<HomeUseCase>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return HomeUseCase(repository);
});
final favoritesUseCaseProvider = Provider<FavoritesUseCase>((ref) {
  final favoritesRepository = ref.watch(favoritesRepositoryProvider);
  return FavoritesUseCase(favoritesRepository);
});
