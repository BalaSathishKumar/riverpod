


import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/starredGitRepoModel.dart';
import '../repo/getrepository_repo.dart';



final StarredRepoControllerProvider = Provider((ref){
  final starredgitRepo = ref.watch(starredRepoProvider);
  return StarredRepoController(starredRepo: starredgitRepo);
});


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