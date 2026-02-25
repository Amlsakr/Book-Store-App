import 'package:book_store_app/core/utils/utils.dart';
import 'package:book_store_app/data/model/book.dart';
import 'package:book_store_app/data/model/book_adapter.dart';
import 'package:book_store_app/firebase_options.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:book_store_app/ui/home/home_screen.dart';
import 'package:book_store_app/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<Book>(Utils.bookStoreHiveBox);
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: AuthGate(),
      ),
    ),
  );
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authViewModelProvider);
    return authState.when(
      data: (user) {
        print("AuthGate State: ${user.data?.email}");
        if (user.data != null) return HomeScreen();
        return SplashScreen();
      },
      error: (error, stackTrace) =>
          Scaffold(body: Center(child: Text("Connection Error: $error"))),
      loading: () => SplashScreen(),
    );
  }
}
