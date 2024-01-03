import 'package:flutter/material.dart';

class DetailTab2 extends StatefulWidget {
  const DetailTab2({Key? key}) : super(key: key);

  @override
  State<DetailTab2> createState() => _DetailTab2State();
}

class _DetailTab2State extends State<DetailTab2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 100,
        width: 200,
        color: Colors.green,
      ),
    );
  }
}
