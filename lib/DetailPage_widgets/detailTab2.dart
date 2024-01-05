import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';

import '../controller/getrepository_controller.dart';
import '../database/user_db.dart';
import '../models/userReponseModel.dart';

class DetailTab2 extends ConsumerStatefulWidget {
  const DetailTab2({super.key});

  @override
  ConsumerState<DetailTab2> createState() => _DetailTab2State();
}

class _DetailTab2State extends ConsumerState<DetailTab2> {

  final userDB = UserDB();

  ScrollController? _scrollController;
  double? _scrollPosition = 0.0;
  int pageNo = 1;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController?.position.pixels;
      if (_scrollPosition == 0) {
         print('At top');
         print('_scrollPosition... ${_scrollPosition}');
      } else {
        //  print('At bottom and cat id: ${_commonProvider.ExploreCatId}');
        //  _scrollController.position.pixels == _scrollController.position.maxScrollExtent
         print('_scrollPosition... ${_scrollPosition} and max scroll ${_scrollController?.position.maxScrollExtent}');

        if(_scrollPosition == _scrollController?.position.maxScrollExtent){
          print('At bottom');
   /*       if(!_commonProvider.IsLastPage){
            pageNo++;
            _commonProvider.setPageNoExplore(pageNo.toString());
            _exploreViewModel.exploreapi(onFailureRes: onFailureRes, onSuccessRes: onSuccessRes, catID: _commonProvider.ExploreCatId,PageNo: pageNo.toString());
          }
*/
        }

      }

    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Colors.white,
     body:  FutureBuilder(
         future: ref.watch(StarredRepoControllerProvider).getStarredGitRepo(),
         builder: (context, snapshot) {
           // snapshot.hasData;
           print('snapshot ${snapshot}');

           if(snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null){
             final gitdatas = snapshot.data;
             return Container(
               child: Column(
                 children: [
                   Expanded(
                     child: ListView.builder(
                       shrinkWrap: true,
                       //  controller: _scrollController,
                      //   physics: NeverScrollableScrollPhysics(),
                         itemCount: gitdatas?.length ?? 0,
                         itemBuilder: (context,index){
                          return      Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            ClipOval(
                                                child: Image.network(
                                              gitdatas?[index].owner?.avatarUrl ??
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgn_Z2YUDgbKoWJgr1EDYL_uLk2XTzMJAAHsCTxrHwi5JuE96TNymRegTQczIv2mvlkrQ&usqp=CAU",
                                              fit: BoxFit.cover,
                                              width: 50.0,
                                              height: 50.0,
                                            )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex:1,
                                                child: Text(gitdatas?[index].name ?? "")),

                                            Expanded(
                                              flex:1,
                                              child: MaterialButton(
                                                child: Text("Add to DB"),
                                                onPressed: ()async{
                                                  print('index:: ${index}');
                                                  var storeDbData =    userResonseModel(
                                                      id: gitdatas?[index].id,
                                                      name: gitdatas?[index].name ?? "",
                                                      description: gitdatas?[index].description ?? "",
                                                      reponame: gitdatas?[index].fullName ?? "",
                                                      stars: gitdatas?[index].score.toString() ?? "");
                                                  await userDB.create(usermodel: storeDbData);

                                                  },
                                                color: Appcolors.dashgreen,
                                                minWidth: 80.0,
                                                height: 20,
                                              ),
                                            )
                                          ],
                                        )),
                                        SizedBox(height: 10,),
                                      repoDetails("Repository Name :",gitdatas?[index].fullName ?? ""),
                                      SizedBox(height: 10,),
                                      repoDetails("Repository Descriptions :",gitdatas?[index].description ?? ""),
                                      SizedBox(height: 10,),
                                      repoDetails("Number of Stars :",gitdatas?[index].score.toString() ?? ""),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                         }),
                   ),
                 ],
               ),
             );

           }else{
             return const Center(child: CircularProgressIndicator(),);
           }

         }
     ),
    );
  }

  Container repoDetails(String txt1,String txt2) {
    return Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex:1,
                                        child: Text(txt1,style: CustomTextStyle.txt14Rbblkbld,)),
                                    Expanded(
                                        flex:1,
                                        child: Text(txt2,maxLines: 3,overflow: TextOverflow.ellipsis,))
                                  ],
                                )
                              ],
                            ),
                          );
  }
}
