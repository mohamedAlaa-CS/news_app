import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc/layout/news_app/Cubit/statse.dart';
import 'package:gdsc/modulse/business/business.dart';
import 'package:gdsc/modulse/scince/scinceScreen.dart';
import 'package:gdsc/modulse/settings/settings.dart';
import 'package:gdsc/modulse/sports/sports.dart';

import '../../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Scince"),
  ];

  List<Widget> Screens = [
    businessScreen(),
    sportsScreen(),
    scinceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScince();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'sa',
        'category': 'business',
        'apiKey': '67d39a4d837e4f4a84f3e79213177b49'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'sa',
          'category': 'sports',
          'apiKey': '67d39a4d837e4f4a84f3e79213177b49'
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> scince = [];

  void getScince() {
    emit(NewsGetScinceLoadingState());
    if (scince.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'sa',
          'category': 'science',
          'apiKey': '67d39a4d837e4f4a84f3e79213177b49'
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        scince = value.data['articles'];
        print(scince[0]['title']);
        emit(NewsGetScinceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScinceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScinceSuccessState());
    }
  }

  bool isDark = false;

  void ChangeNewsApp() {
    isDark = !isDark;
    emit(NewsChangeModeState());
  }
}
