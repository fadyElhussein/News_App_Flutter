import 'package:news_app/shared/cubit/cubit.dart';

import '../../shared/network/Remote/dio_helper.dart';

class ApiData {
  String countryOfNews ='ae';

  List<dynamic> business = [];
  void getbusiness() {
    if (countryOfNews == 'ae') {
      DioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'ae',
          'category': 'business',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        business = value.data['articles'];
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      DioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        business = value.data['articles'];
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    if (countryOfNews == 'ae') {
      DioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'ae',
          'category': 'sports',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      DioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (countryOfNews == 'ae') {
      DioHelper.getData(url: 'v2/top-headlines', Query: {
        'country': 'ae',
        'category': 'science',
        'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      DioHelper.getData(url: 'v2/top-headlines', Query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic> health = [];
  void getHealth() {
    if (countryOfNews == 'ae') {
      DioHelper.getData(url: 'v2/top-headlines', Query: {
        'country': 'ae',
        'category': 'health',
        'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
      }).then((value) {
        health = value.data['articles'];
        print(health[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      DioHelper.getData(url: 'v2/top-headlines', Query: {
        'country': 'us',
        'category': 'health',
        'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
      }).then((value) {
        health = value.data['articles'];
        print(health[0]['title']);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

  List<dynamic> search = [];
  void getsearch({required String valueOfSearch}) {
    print("The Value is ${valueOfSearch}");
    DioHelper.getData(url: 'v2/everything', Query: {
      'q': '$valueOfSearch',
      'apiKey': '70ab8dfefc8d44dc9b1141354f88be65',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
