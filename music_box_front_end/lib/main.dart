import 'package:flutter/material.dart';
import 'package:music_box_front_end/my_home_page.dart';

main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      scrollBehavior: MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


