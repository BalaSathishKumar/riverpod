import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';

import '../controller/product_controller.dart';
import '../database/user_db.dart';
import '../models/userReponseModel.dart';

class DetailTab2 extends ConsumerWidget {

  final userDB = UserDB();

  @override
  Widget build(BuildContext context, WidgetRef ref) {


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
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SingleChildScrollView(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[

                       Container(
                         height: 60,
                         // color: Colors.red.shade50,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             children: [
                               Expanded(child: Text("The Most starred Github repos",style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold))),
                               Text("All Tasks",style: TextStyle(fontSize: 16,color: Colors.grey)),
                               Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,)
                             ],
                           ),
                         ),
                       ),
                 /*      StarredTile(
                         gitdatas: gitdatas,
                         overLapImg: overLapImg,
                         onPressed: (bool){
                         },
                         onPressedchk: (index){
                           print('inexxx $index');
                           ref.read(checkboxProvider.notifier).state = index;
                         },
                         selectedIndex: ref.watch(checkboxProvider),
                       )*/

                       ListView.builder(
                         shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: gitdatas?.length ?? 0,
                           itemBuilder: (context,index){
                            return      GestureDetector(
                              onTap: ()async{
                                print('index:: ${index}');
                              var storeDbData =    userResonseModel(
                                  id: gitdatas?[index].id,
                                  name: gitdatas?[index].name ?? "",
                                  description: gitdatas?[index].description ?? "",
                                  reponame: gitdatas?[index].fullName ?? "",
                                  stars: gitdatas?[index].score.toString() ?? "");
                                await userDB.create(usermodel: storeDbData);

                                },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 2,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: ClipOval(
                                                child: Image.network(
                                                  gitdatas?[index].owner?.avatarUrl ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgn_Z2YUDgbKoWJgr1EDYL_uLk2XTzMJAAHsCTxrHwi5JuE96TNymRegTQczIv2mvlkrQ&usqp=CAU",
                                                  fit: BoxFit.cover,
                                                  width: 50.0,
                                                  height: 50.0,
                                                )
                                            ),
                                            contentPadding:   EdgeInsets.all(8.0),
                                            title: Text(gitdatas?[index].name ?? ""),
                                          ),
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
                              ),
                            );
                           }),




                     ],
                   ),
                 ),
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
