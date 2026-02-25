import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/ui/auth/auth_view_model.dart';
import 'package:book_store_app/ui/favorites/favorites_view_model.dart';
import 'package:book_store_app/ui/home/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    AsyncNotifierProvider<AuthViewModel, ApiResponse<User?>>(() {
      return AuthViewModel();
    });

final homeViewModelProvider =
    AsyncNotifierProvider<HomeViewModel, ApiResponse<List<Book>>>(() {
      return HomeViewModel();
    });
final favoritesViewModelProvide =
    NotifierProvider<FavoritesViewModel, List<Book>>(FavoritesViewModel.new);
