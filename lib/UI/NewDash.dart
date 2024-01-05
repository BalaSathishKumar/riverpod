import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofcriverpod/Dashboard_Widgets/starredTile.dart';
import 'package:ofcriverpod/models/starredGitRepoModel.dart';

import '../Dashboard_Widgets/DashboardOptions.dart';
import '../controller/getrepository_controller.dart';
var checkboxProvider= StateProvider<int>((ref) => 0);

class NewDash extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    List<String> overLapImg = [
      "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRGD6R6Mj8gLH_Bb_aO1NnZC-eqYFx1XJ3K1d1oFCx42K5fXl8B3LSCVD4vrv-RpLQ_Kg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBC9GBMM--i_8SSmRd_8edGERGCZfWGTeo9g60s9lgA85SS0Be2dQQPn5ipNLgg_hReeM&usqp=CAU"];

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      //  backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
        title:ClipOval(
            child: Image.network(
              "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
              fit: BoxFit.cover,
              width: 30.0,
              height: 30.0,
            )
        ),
      ),
      //https://stackoverflow.com/questions/76348944/when-to-use-consumerwidget-and-consumer
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
                        nameCard(devicewidth,"Hello","Alex Mahone"),
                        SizedBox(
                          height: 18,
                        ),
                        dashboardOptions(),
                        SizedBox(
                          height: 18,
                        ),
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
                        StarredTile(
                            gitdatas: gitdatas,
                            overLapImg: overLapImg,
                          onPressed: (bool){
                              },
                          onPressedchk: (index){
                            print('inexxx $index');
                            ref.read(checkboxProvider.notifier).state = index;
                          },
                          selectedIndex: ref.watch(checkboxProvider),
                        )
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


}

Container nameCard(double devicewidth,String txt1,String txt2) {
  return Container(
    color: Colors.white,
    width: devicewidth,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(txt1,style: TextStyle(fontSize: 18,color: Colors.grey),),
          SizedBox(
            height: 8,
          ),
          Text(txt2,style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}


