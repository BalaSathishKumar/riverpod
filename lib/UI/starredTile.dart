import 'package:flutter/material.dart';

import '../models/starredGitRepoModel.dart';


class StarredTile extends StatelessWidget {
  const StarredTile({
    super.key,
    required this.gitdatas,
    required this.overLapImg,
  });

  final List<Items>? gitdatas;
  final List<String> overLapImg;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: gitdatas?.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Container(
                //height: 80,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(width: 18),
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

        });
  }
}