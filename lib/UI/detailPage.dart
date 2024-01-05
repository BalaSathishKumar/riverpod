import 'package:flutter/material.dart';
import 'package:ofcriverpod/DetailPage_widgets/detailTab1.dart';
import 'package:ofcriverpod/constants/colors.dart';
import 'package:ofcriverpod/utils/common_textstyles.dart';

import 'NewDash.dart';
import '../DetailPage_widgets/detailTab2.dart';
import '../DetailPage_widgets/detailTab3.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin{

  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);

  }
  void _handleTabSelection() {
    setState(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Container(
             width: devicewidth,
             child: Text("Project",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
           ),
            SizedBox(
              height: 18,
            ),
            TabBar(
              isScrollable: false,
              splashFactory: NoSplash.splashFactory,
              controller: _controller,
              dividerColor: Colors.white,
              padding: const EdgeInsets.all(8.0),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Appcolors.dashpurple),
              tabs: [
                Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text("All",style: _selectedIndex == 0?CustomTextStyle.txt14Rbwht:CustomTextStyle.txt14Rbblk))),
                Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text("Ongoing",style: _selectedIndex == 1?CustomTextStyle.txt14Rbwht:CustomTextStyle.txt14Rbblk))),
                Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text("Completed",style:_selectedIndex == 2? CustomTextStyle.txt14Rbwht:CustomTextStyle.txt14Rbblk))),
              ],
            ),
            Expanded(child: Container(
             // color: Colors.red,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller:_controller ,
                  children: <Widget>[
                   DetailTab1(),
                   DetailTab2(),
                   DetailTab3(),
                  ],
            )))

          ],
        ),
      ),
    );
  }
}
