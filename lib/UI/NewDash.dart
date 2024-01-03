import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Dashboard_Widgets/DashboardOptions.dart';
import '../controller/product_controller.dart';


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
      appBar: AppBar(
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
              width: 50.0,
              height: 50.0,
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
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: gitdatas?.length,
                            itemBuilder: (context,index){
                              return Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    //height: 80,
                                    //color: Colors.red.shade50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.adjust_rounded,size: 16,),
                                          SizedBox(width: 18),
                                          Expanded(
                                            child: Container(
                                              height: 50,
                                              // color: Colors.yellow,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(gitdatas?[index].name ?? "" ,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        shadows: [
                                                          Shadow(
                                                              color: Colors.black,
                                                              offset: Offset(0, -8))
                                                        ],
                                                        color: Colors.transparent,
                                                        decoration: TextDecoration.underline,
                                                        decorationColor: Colors.green.shade200,
                                                        decorationThickness: 10),),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //   setOverLap(overLapImg)
                                          for(int i=0 ; i< overLapImg.length; i++)
                                            Align(
                                              widthFactor: 0.6,
                                              child: ClipOval(
                                                  child: Image.network(
                                                    overLapImg[i],
                                                    fit: BoxFit.cover,
                                                    width: 20.0,
                                                    height: 20.0,
                                                  )
                                              ),
                                            ),
                                          SizedBox(width: 8),
                                          Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,size: 16,)

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );

                            })
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

  Container nameCard(double devicewidth,String txt1,String txt2) {
    return Container(
      // color: Colors.red,
      width: devicewidth,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(txt1,style: TextStyle(fontSize: 16,color: Colors.grey),),
            SizedBox(
              height: 8,
            ),
            Text(txt2,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
