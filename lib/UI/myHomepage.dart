import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors.dart';
import 'NewDash.dart';
import 'dashboardDesign.dart';
import 'detailPage.dart';
var indexProvider= StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerWidget {


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

    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.dashpurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardDesign()));
        },
        //params
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: icondata.length,
        activeIndex: ref.watch(indexProvider),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,


          tabBuilder: (int index, bool isActive) {
            print('tabBuilder ${index} :: ${isActive}');
            return Icon(
              icondata[index],
              size: 24,
              color: isActive ? Appcolors.dashpurple : Appcolors.grey,
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


}