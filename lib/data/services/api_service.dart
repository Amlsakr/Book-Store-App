import 'dart:convert';

import 'package:book_store_app/data/model/book.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/utils.dart';

class ApiService {
  Future<List<Book>> getBooks() async {
    var url = Uri.parse(Utils.baseURL);
    final response = await http.get(
      url,
      headers: {Utils.headerAcceptKey: Utils.headerAcceptValue},
    );
    final List body = json.decode(response.body);
    return body.map((e) => Book.fromJson(e)).toList();
  }
}
