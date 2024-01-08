import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/starredGitRepoModel.dart';


class StarredTile extends StatelessWidget {
  const StarredTile({
    super.key,
    required this.gitdatas,
    required this.overLapImg,
    required this.onPressed,
    required this.onPressedchk,
    this.selectedIndex
  });

  final List<Items>? gitdatas;
  final List<String> overLapImg;
  final Function(bool?)? onPressed;
  final Function(int?)  onPressedchk;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: gitdatas?.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              onPressedchk(index);
              },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //height: 80,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                    Checkbox(
                      checkColor: Colors.white,
                     activeColor: Appcolors.dashgreen,
                     // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: selectedIndex == index ? true: false,
                      shape: CircleBorder(),
                      onChanged: onPressed
                    ),
                    //  SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 70,
                         //  color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(gitdatas?[index].name ?? "" ,
                                  maxLines: 1,
                                ),
                              ),

                              LinearPercentIndicator(
                                //width: devicewidth,
                                lineHeight: 8.0,
                                percent: 0.9,
                                barRadius: Radius.circular(16),
                                backgroundColor: Colors.grey.shade100,
                                progressColor: Appcolors.dashgreen,
                              ),
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