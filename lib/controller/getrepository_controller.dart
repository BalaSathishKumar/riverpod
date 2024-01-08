


import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../UI/NewDash.dart';
import '../models/starredGitRepoModel.dart';
import '../repo/getrepository_repo.dart';




final userProvider= Provider<StarredRepoController>((ref){
  final starredgitRepo = ref.watch(starredRepoProvider);
 return StarredRepoController(starredgitRepo);
});

final userDataProvider = FutureProvider<List<Items>>((ref) async {
  return ref.watch(userProvider).getStarredGitRepo(ref.watch(pagenoProvider));
});
class StarredRepoController {
  final StarredGitRepo _starredRepo;

  StarredRepoController(this._starredRepo);
  List<Items> gitItems = [];
  Future<List<Items>> getStarredGitRepo(int pageno) async {
    final response = await _starredRepo.getStarredRepo(pageno);
  //  final data = jsonDecode(response.body);

   // gitItems = [];
  //  final gitItemJson = data['items'];
    StarredRepoModel? stareddata = response;
    print('stareddata res:: ${stareddata?.totalCount}');
    for( Items strdata in stareddata?.items ?? []){
    //  gitItems.add(Items.fromJson(stareddata));
      print('stareddatastareddata ::${strdata}');
      gitItems.add(strdata);

    }
    print('gitItems:::: ${gitItems.length}');
    return gitItems;
  }
}