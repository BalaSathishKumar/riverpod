import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../models/starredGitRepoModel.dart';
import '../repo/product_repo.dart';





final productControllerProvider = Provider((ref){
  final productRepo = ref.watch(productRepoProvider);
  return ProductController(productRepo: productRepo);
});


final StarredRepoControllerProvider = Provider((ref){
  final starredgitRepo = ref.watch(starredRepoProvider);
  return StarredRepoController(starredRepo: starredgitRepo);
});

class ProductController {
  final ProductRepo _productRepo;

  ProductController({required ProductRepo productRepo}):_productRepo = productRepo;

  Future<List<Product>> getProducts() async {
    final response = await _productRepo.getProducts();
    final data = jsonDecode(response.body);
    List<Product> products = [];
    final productsJson = data['products'];

    for(dynamic productJson in productsJson){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }
}
class StarredRepoController {
  final StarredGitRepo _starredRepo;

  StarredRepoController({required StarredGitRepo starredRepo}):_starredRepo = starredRepo;

  Future<List<Items>> getStarredGitRepo() async {
    final response = await _starredRepo.getStarredRepo();
  //  final data = jsonDecode(response.body);

    List<Items> gitItems = [];
  //  final gitItemJson = data['items'];
    StarredRepoModel? stareddata = response;
    print('stareddata res:: ${stareddata?.totalCount}');
    for( Items strdata in stareddata?.items ?? []){
    //  gitItems.add(Items.fromJson(stareddata));
      print('stareddatastareddata ::${strdata}');
      gitItems.add(strdata);
      print('gitItems:::: ${gitItems.length}');
    }
    return gitItems;
  }
}