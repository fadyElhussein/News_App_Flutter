import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/BusinessScreen/BusinessScreen.dart';
import 'package:news_app/modules/ScienceScreen/ScienceScreen.dart';
import 'package:news_app/modules/SportsScreen/SportsScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/Local/cacheHelper.dart';
import '../../modules/HealthScreen/HealthScreen.dart';
import '../network/Remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super (NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomNavBar = [
    const BottomNavigationBarItem(
        icon:Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon:Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon:Icon(Icons.science),
      label: "Science",
    ),
    const BottomNavigationBarItem(
      icon:Icon(Icons.health_and_safety),
      label: "Health",
    ),

  ];

  int currentindex=0;
  changeBottomNavBar(int index){
    currentindex=index;
    if(index==0) {
      getbusiness();
    }
    if(index==1) {
      getSports();
    }
    if(index==2) {
      getScience();
    }
    if(index==3) {
      getHealth();
    }

    emit(NewsBottomNavBarState());
  }
  List <Widget> screens=[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const HealthScreen(),
  ];

  bool isDark=false;
  void ChangeAppThemeMode({bool? fromShared}){
    if(fromShared ==null)
      {
        isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppThemeModeState());
      });

      }
    else {
      isDark=fromShared;
      emit(NewsChangeAppThemeModeState());
    }

  }


  String countryOfNews ='ae';
  void changeCountryOfNews(){
    if(countryOfNews=='ae')
      {
        countryOfNews ='us';
        if(currentindex==0)
          {
            getbusiness();
          }
        if(currentindex==1)
        {
          getSports();
        }
        if(currentindex==2)
        {
          getScience();
        }
        if(currentindex==3)
        {
          getHealth();
        }
      }
    else
      {
        countryOfNews ='ae';
        if(currentindex==0)
        {
          getbusiness();
        }
        if(currentindex==1)
        {
          getSports();
        }
        if(currentindex==2)
        {
          getScience();
        }
        if(currentindex==3)
        {
          getHealth();
        }
      }
    emit(NewsChangeCountryState());

  }


  List<dynamic>business=[];
  void getbusiness(){
    if(countryOfNews=='ae') {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'ae',
          'category': 'business',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
    else
      {
        emit(NewsGetBusinessLoadingEnglishState());
        DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'us',
            'category': 'business',
            'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
          },
        ).then((value) {
          business = value.data['articles'];
          emit(NewsGetBusinessDataSuccefullState());
        }).catchError((error) {
          print(error.toString());
        });
      }
}

  List<dynamic>sports=[];
  void getSports(){
    if(countryOfNews=='ae') {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'ae',
          'category': 'sports',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
    else{
      emit(NewsGetSportsLoadingEnglishState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'us',
          'category': 'sports',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic>science=[];
  void getScience(){
    if(countryOfNews=='ae') {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'ae',
            'category': 'science',
            'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
          }
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
    else{
      emit(NewsGetScienceLoadingEnglishState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'us',
            'category': 'science',
            'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
          }
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic>health=[];
  void getHealth(){
    if(countryOfNews=='ae') {
      emit(NewsGetHealthLoadingState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'ae',
            'category': 'health',
            'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
          }
      ).then((value) {
        health = value.data['articles'];
        print(health[0]['title']);
        emit(NewsGetHealthDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
    else{
      emit(NewsGetHealthLoadingEnglishState());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'us',
            'category': 'health',
            'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
          }
      ).then((value) {
        health = value.data['articles'];
        print(health[0]['title']);
        emit(NewsGetHealthDataSuccefullState());
      }).catchError((error) {
        print(error.toString());
      });
    }
  }


  List<dynamic>search=[];
  void getSearch({required String valueOfSearch}){
    emit(NewsGetSearchLoadingState());
    print("The Value is ${valueOfSearch}");
    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '$valueOfSearch',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        }
    ).then((value) {
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
    });
  }

}