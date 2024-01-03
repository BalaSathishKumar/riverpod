import 'package:flutter/material.dart';
import 'package:ofcriverpod/constants/colors.dart';


class dashboardOptions extends StatelessWidget {
  const dashboardOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex:1,
                  child: dashTile("In Progress",Icons.watch_later_outlined,Appcolors.dashorange),
                ),
                SizedBox(
                  width: 10,
                ),Expanded(
                  flex:1,
                  child: dashTile("Ongoing",Icons.repeat,Appcolors.dashpurple),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex:1,
                  child: dashTile("Completed",Icons.file_copy,Appcolors.dashgreen),
                ),
                SizedBox(
                  width: 10,
                ),Expanded(
                  flex:1,
                  child: dashTile("Cancel",Icons.free_cancellation,Appcolors.dashdarkorange),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Container dashTile(String txt,IconData icon,Color clr) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white),
          SizedBox(
            height: 8,
          ),
          Text(txt,style: TextStyle(fontSize:18,color: Colors.white)),
        ],
      ),
    );
  }
}