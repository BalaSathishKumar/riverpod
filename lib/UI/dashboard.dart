import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofcriverpod/UI/NewDash.dart';
import 'package:ofcriverpod/constants/colors.dart';

import '../Dashboard_Widgets/DashboardOptions.dart';
import '../controller/product_controller.dart';
import 'detailPage.dart';
var indexProvider= StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerWidget {

  List<String> overLapImg = [
    "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRGD6R6Mj8gLH_Bb_aO1NnZC-eqYFx1XJ3K1d1oFCx42K5fXl8B3LSCVD4vrv-RpLQ_Kg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBC9GBMM--i_8SSmRd_8edGERGCZfWGTeo9g60s9lgA85SS0Be2dQQPn5ipNLgg_hReeM&usqp=CAU"];
  List<IconData> icondata = [Icons.home,Icons.document_scanner,Icons.mail,Icons.settings];

  int  _bottomNavIndex = 1;
  List<Widget> _pages = [
    NewDash(),
    DetailPage(),
    NewDash(),
    DetailPage(),

  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(onPressed: () {  },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: icondata.length,
        activeIndex: ref.watch(indexProvider),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,

          tabBuilder: (int index, bool isActive) {
            print('tabBuilder ${index} :: ${isActive}');
            return Icon(
              icondata[index],
              size: 24,
              color: isActive ? Appcolors.purchaseGreenNew : Appcolors.red,
            );},
        onTap: (index) {

          _bottomNavIndex = ref.read(indexProvider.state).state = index;
          print('_bottomNavIndex ${_bottomNavIndex}');

          if(index == 2){
            DetailPage();
          }
        },
      ),

     body: _pages[ref.watch(indexProvider)],

    );
  }

  setOverLap(List<String> overLapImg) {

    for(int i=0 ; i< overLapImg.length; i++)
      return   Align(
        widthFactor: 0.5,
        child: ClipOval(
            child: Image.network(
              overLapImg[i],
              fit: BoxFit.cover,
              width: 20.0,
              height: 20.0,
            )
        ),
      );



  }
}