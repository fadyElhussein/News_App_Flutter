import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/News_App_Layout.dart';
import 'package:news_app/shared/cubit/constant.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/Local/cacheHelper.dart';
import 'package:news_app/shared/network/Remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //طلاما عملت ال   main async لازم احط () WidgetsFlutterBinding.ensureInitialized دي معنها ان ينفز كل حاجه في  main  وبعدين يشغل البرنامج
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper
      .init(); //   علشان دي في الاصل async يبقي اعمل await عليها هنا
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(NewsApp(isDark!));
}

class NewsApp extends StatelessWidget {
  final bool isDark;
  const NewsApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..ChangeAppThemeMode(fromShared: isDark)
        ..getbusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                color: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrangeAccent,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.white12,
              appBarTheme: const AppBarTheme(
                color: Colors.white12,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white12,
                  statusBarIconBrightness: Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white60,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white12,
                unselectedItemColor: Colors.white60,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrangeAccent,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
