import 'package:flutter/material.dart';


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
                  child: dashTile("In Progress",Icons.watch_later_outlined,Colors.amber.shade200),
                ),
                SizedBox(
                  width: 10,
                ),Expanded(
                  flex:1,
                  child: dashTile("Ongoing",Icons.repeat,Colors.blue.shade200),
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
                  child: dashTile("Completed",Icons.file_copy,Colors.green.shade200),
                ),
                SizedBox(
                  width: 10,
                ),Expanded(
                  flex:1,
                  child: dashTile("Cancel",Icons.free_cancellation,Colors.red.shade200),
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
          Text(txt,style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}