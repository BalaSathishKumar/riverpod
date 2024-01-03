import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/starredGitRepoModel.dart';

final productRepoProvider = Provider((ref) => ProductRepo());
final starredRepoProvider = Provider((ref) => StarredGitRepo());

class ProductRepo {
  Future<http.Response> getProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    log(response.body);
    return response;
  }
}
class StarredGitRepo {
  Future<StarredRepoModel?> getStarredRepo() async {
    final url = Uri.parse('https://api.github.com/search/repositories?q=created:%3E2022-04-29&sort=stars&order=desc');
    final response = await http.get(url);
    final jsonresponse = json.decode(response.body);
    log(response.body);
    return StarredRepoModel.fromJson(jsonresponse);

    // log(response.body);
    // return response;
  }
}