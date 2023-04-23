import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc/counter/counter.dart';
import 'package:gdsc/counter/cuibt/cuibt.dart';
import 'package:gdsc/layout/news_app/Cubit/cubit.dart';
import 'package:gdsc/layout/news_app/Cubit/statse.dart';
import 'package:gdsc/network/remote/dio_helper.dart';
import 'package:gdsc/shard/bloc_observer.dart';

import 'package:gdsc/shard/cubit/states.dart';
import 'package:gdsc/task.dart';
import 'package:gdsc/layout/todo/home_layout.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: HexColor("333739"),
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor("333739"),
            statusBarIconBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: HexColor("333739"),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 20.0,
          backgroundColor: HexColor("333739"),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: NewsLayout(),
    );
  }
}
