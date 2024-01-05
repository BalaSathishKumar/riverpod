
import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/Strings.dart';
import 'chart.dart';
import '../Dashboard_Widgets/checkboxContainer.dart';

class DashboardDesign extends StatefulWidget {
  const DashboardDesign({Key? key}) : super(key: key);

  @override
  State<DashboardDesign> createState() => _DashboardDesignState();
}

class _DashboardDesignState extends State<DashboardDesign> {
  late List<ExpenseData> _chartdata;



  List<ExpenseData> getChartData(){

    final List<ExpenseData> chartData = [
      ExpenseData("Food",55,40,45,48),
      ExpenseData("Transport",55,40,45,48),
      ExpenseData("Medical",55,40,45,48),
      ExpenseData("Clothes",55,40,45,48),
      ExpenseData("Books",55,40,45,48),
      ExpenseData("Others",55,40,45,48),
    ];

    return chartData;
  }

  @override
  void initState() {
    super.initState();
    _chartdata = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;



    return Scaffold(
    appBar: AppBar(
      //backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading:Icon(Icons.arrow_back_ios) ,
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert),
      )],
    ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: devicewidth,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12,),
                                Text("Dashboard Design",style: CustomTextStyle.txt24blkbld,),
                                SizedBox(height: 5),
                                Text("Today,shared by - Unbox Digital",style: CustomTextStyle.txt20Rbgrey,),
                                SizedBox(height: 12,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: CircularPercentIndicator(
                                            radius: 50.0,
                                            lineWidth: 8.0,
                                            animation: true,
                                            //  percent: double.parse( projectdata[index].percentage)/100,
                                            percent: 0.8,
                                            center: Text(
                                                "85%",
                                                style:CustomTextStyle.txt24blkbld
                                            ),
                                            circularStrokeCap: CircularStrokeCap.round,
                                            progressColor: Appcolors.dashgreen,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Team",style: CustomTextStyle.txt14Rbblk,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                for(int i=0 ; i< Strings.overLapImg.length; i++)
                                                  Align(
                                                    widthFactor: 0.6,
                                                    child: ClipOval(
                                                        child: Image.network(
                                                          Strings.overLapImg[i],
                                                          fit: BoxFit.cover,
                                                          width: 25.0,
                                                          height: 25.0,
                                                        )
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Text("Deadline",style: CustomTextStyle.txt18Rbblkbld,),
                                          SizedBox(height: 12,),
                                          Text("June 15,2023 - June 22,2023",style: CustomTextStyle.txt18Rbgrey,)
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                                SizedBox(height: 50,),
                                CheckboxDesign(
                                  title: 'Project Progress',
                                  strings: ['Create user flow', 'Create wireframe', 'Transform to visual design'],
                                ),
                                SizedBox(height: 12,),
                                SizedBox(height: 30,),
                                Text(
                                  "Project Overview",
                                  style: CustomTextStyle.txt18Rbblkbld,
                                ),
                                SizedBox(height: 12,),
                                Container(
                                  height: 200,
                                width: devicewidth,
                                child: LineChartSample2(),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}


class ExpenseData {
  ExpenseData(this.expenseCategory,this.father,this.mother,this.son,this.daughter);
  final String? expenseCategory;
  final num? father;
  final num? mother;
  final num? son;
  final num? daughter;
}