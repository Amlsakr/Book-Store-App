import 'package:book_store_app/firebase_options.dart';
import 'package:book_store_app/providers/repository_providers.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:book_store_app/ui/home/home_screen.dart';
import 'package:book_store_app/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: MaterialApp(home: AuthGate())));
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authState = ref.watch(authViewModelProvider);
    return authState.when(
      data: (user) {
        print("AuthGate State: ${user?.email}");
        if (user != null) return HomeScreen();
        return SplashScreen();
      },
      error: (error, stackTrace) =>
          Scaffold(body: Center(child: Text("Connection Error: $error"))),
      loading: () => SplashScreen(),
    );
  }
}
