import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/starredGitRepoModel.dart';

final starredRepoProvider = Provider<StarredGitRepo>((ref) => StarredGitRepo());


class StarredGitRepo {
  Future<StarredRepoModel?> getStarredRepo(int pageno) async {
    print('page no in repo $pageno');
    String pgno = pageno.toString();
    final url = Uri.parse('https://api.github.com/search/repositories?q=created:%3E2022-04-29&sort=stars&order=desc&page=$pgno');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonresponse = json.decode(response.body);
      log(response.body);
      return StarredRepoModel.fromJson(jsonresponse);

    }

    return null;


  }
}