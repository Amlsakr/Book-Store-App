import 'package:connectivity_plus/connectivity_plus.dart';

abstract final class Utils {
  static const passwordLength = 6;
  static const emailValidation = "@";
  static const baseURL = "https://potterapi-fedeperin.vercel.app/en/books";
  static const headerAcceptKey = "accept";
  static const headerAcceptValue = "application/json";

  static Future<bool> isConnected() async {
    final Connectivity connectivity = Connectivity();
    final result = await connectivity.checkConnectivity();
    return ConnectivityResult.none != result.first;
  }
}
