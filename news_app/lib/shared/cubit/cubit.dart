import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api.dart';
import 'package:news_app/modules/BusinessScreen/BusinessScreen.dart';
import 'package:news_app/modules/ScienceScreen/ScienceScreen.dart';
import 'package:news_app/modules/SportsScreen/SportsScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/Local/cacheHelper.dart';
import '../../modules/HealthScreen/HealthScreen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomNavBar = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety),
      label: "Health",
    ),
  ];

  int currentindex = 0;
  changeBottomNavBar(int index) {
    currentindex = index;
    if (index == 0) {
      businessdataloaeded();
    }
    if (index == 1) {
      ApiData().getSports();
    }
    if (index == 2) {
      ApiData().getScience();
    }
    if (index == 3) {
      ApiData().getHealth();
    }

    emit(NewsBottomNavBarState());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const HealthScreen(),
  ];

  bool isDark = false;
  void changeAppThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppThemeModeState());
    } else {
      isDark = !isDark;
      cacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppThemeModeState());
      });
    }
  }

  void changeCountryOfNews() {
    if (ApiData().countryOfNews == 'ae') {
      ApiData().countryOfNews = 'us';
      if (currentindex == 0) {
        businessdataloaeded();
      }
      if (currentindex == 1) {
        ApiData().getSports();
      }
      if (currentindex == 2) {
        ApiData().getScience();
      }
      if (currentindex == 3) {
        ApiData().getHealth();
      }
    } else {
      ApiData().countryOfNews = 'ae';
      if (currentindex == 0) {
        ApiData().getbusiness();
      }
      if (currentindex == 1) {
        ApiData().getSports();
      }
      if (currentindex == 2) {
        ApiData().getScience();
      }
      if (currentindex == 3) {
        ApiData().getHealth();
      }
    }
    emit(NewsChangeCountryState());
  }
    List<dynamic> business = [];
  void businessdataloaeded() {
    emit(NewsGetBusinessLoadingState());
    business=ApiData().business;
    emit(NewsGetBusinessDataSuccefullState());
  }
}
