import 'package:flutter/material.dart';

class DetailTab3 extends StatefulWidget {
  const DetailTab3({Key? key}) : super(key: key);

  @override
  State<DetailTab3> createState() => _DetailTab3State();
}

class _DetailTab3State extends State<DetailTab3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 100,
        width: 200,
        color: Colors.yellow,
      ),
    );
  }
}
