import 'dart:core';

import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../models/projectModel.dart';


class DetailTab1 extends StatefulWidget {
  const DetailTab1({Key? key}) : super(key: key);

  @override
  State<DetailTab1> createState() => _DetailTab1State();
}

class _DetailTab1State extends State<DetailTab1> {
  final List<ProjectModel> projectdata = [
    ProjectModel(title: "App Animation",subtitle: "Today,shared by - Unbox Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "65",color: "0xFF9297FF"),
    ProjectModel(title: "Dashboard Design",subtitle: "Today,shared by - UI Bean Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "85",color: "0xFFC2EA94"),
    ProjectModel(title: "UI/UX Design",subtitle: "Today,shared by - Unbox",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "30",color: "0xFFFF7648"),
    ProjectModel(title: "App Animation",subtitle: "Today,shared by - Unbox Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "65",color: "0xFF9297FF"),
    ProjectModel(title: "Dashboard Design",subtitle: "Today,shared by - UI Bean Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "85",color: "0xFFC2EA94"),
    ProjectModel(title: "UI/UX Design",subtitle: "Today,shared by - Unbox",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "30",color: "0xFFFF7648"),
    ProjectModel(title: "App Animation",subtitle: "Today,shared by - Unbox Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "65",color: "0xFF9297FF"),
    ProjectModel(title: "Dashboard Design",subtitle: "Today,shared by - UI Bean Digital",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "85",color: "0xFFC2EA94"),
    ProjectModel(title: "UI/UX Design",subtitle: "Today,shared by - Unbox",name: "Team",date: "June 15,2023 - June 22,2023",percentage: "30",color: "0xFFFF7648"),
  ];
  ScrollController? _scrollController;
  double? _scrollPosition = 0.0;
  int pageNo = 1;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController?.position.pixels;
      print('_scrollPosition... ${_scrollPosition}');
      if (_scrollPosition == 0) {
        print('At top');
        print('_scrollPosition... ${_scrollPosition}');
      } else {
        //  print('At bottom and cat id: ${_commonProvider.ExploreCatId}');
        //  _scrollController.position.pixels == _scrollController.position.maxScrollExtent
        print('_scrollPosition... ${_scrollPosition} and max scroll ${_scrollController?.position.maxScrollExtent}');

        if(_scrollPosition == _scrollController?.position.maxScrollExtent){
          print('At bottom');
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: projectdata.length,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: devicewidth,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 12,),
                                    Text(projectdata[index].title,style: CustomTextStyle.txt14Rbblkbld,),
                                    SizedBox(height: 5),
                                    Text(projectdata[index].subtitle,style: CustomTextStyle.txt12Rbgrey,),
                                    SizedBox(height: 12,),
                                    Text(projectdata[index].name,style: CustomTextStyle.txt12blkbld,),
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
                                    Text(projectdata[index].date,style: CustomTextStyle.txt12Rbgrey,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                child: CircularPercentIndicator(
                                  radius: 50.0,
                                  lineWidth: 8.0,
                                  animation: true,
                                 percent: double.parse( projectdata[index].percentage)/100,
                                 // percent: 0.8,
                                  center: Text(
                                    "${projectdata[index].percentage}%",
                                    style:CustomTextStyle.txt24blkbld
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Color(int.parse( projectdata[index].color)),
                                ),
                                ),
                              )
                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
