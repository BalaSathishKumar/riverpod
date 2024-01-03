import 'package:flutter/material.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';


class DetailTab1 extends StatefulWidget {
  const DetailTab1({Key? key}) : super(key: key);

  @override
  State<DetailTab1> createState() => _DetailTab1State();
}

class _DetailTab1State extends State<DetailTab1> {
  @override
  Widget build(BuildContext context) {
    List<String> overLapImg = [
      "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRGD6R6Mj8gLH_Bb_aO1NnZC-eqYFx1XJ3K1d1oFCx42K5fXl8B3LSCVD4vrv-RpLQ_Kg&usqp=CAU",
      "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBC9GBMM--i_8SSmRd_8edGERGCZfWGTeo9g60s9lgA85SS0Be2dQQPn5ipNLgg_hReeM&usqp=CAU",
    "https://cdn-icons-png.flaticon.com/512/3059/3059633.png"];




    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 // height: 150,
                  width: devicewidth,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12,),
                        Text("App Animation",style: CustomTextStyle.txt14Rbblkbld,),
                        SizedBox(height: 5),
                        Text("Today, shared by - Unbox Digital",style: CustomTextStyle.txt12Rbgrey,),
                        SizedBox(height: 12,),
                        Text("Team",style: CustomTextStyle.txt12blkbld,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
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
                            ],
                          ),
                        ),
                        Text("June 15,2023 - June 22,2023",style: CustomTextStyle.txt12Rbgrey,),

                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
