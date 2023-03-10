import 'package:flutter/material.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/provider/loading_provider.dart';
import 'package:news_app/src/view/screens/news/new_infinit.dart';
import 'package:news_app/src/view/widgets/bottombard.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  // MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider<CircuitProvider>
  //           (create: (ctx)=>CircuitProvider()),
  //    ],
  //    child: const MyApp(),
  // );
  runApp(
    // MyApp()
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingProvider>(
            create: (ctx) => LoadingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home:  NewsPageView(),
      home: MyNavigationBar(),

    );
  }
}