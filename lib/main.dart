import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofcriverpod/constants/colors.dart';

import 'UI/myHomepage.dart';
import 'constants/theme_color.dart';



void main() {
  runApp(
      ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: ThemeColor.Primary,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: Colors.white54,
        colorScheme: ColorScheme.light(primary: Colors.white),
      ),
      home:  MyHomePage(),
    );
  }
}




