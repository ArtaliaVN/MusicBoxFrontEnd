import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/pageWidgets/my_home_page.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:provider/provider.dart';

main()  {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


