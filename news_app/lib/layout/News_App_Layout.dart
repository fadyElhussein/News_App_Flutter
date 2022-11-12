import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/Reusable_component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../modules/SearchScreen/searchScreen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context , state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                MaterialButton(
                  child: Text(cubit.countryOfNews=='ae'?"US":"EG"),
                    onPressed:() {
                      cubit.changeCountryOfNews();
                    },minWidth: 1.0,),
                IconButton(
                    onPressed: (){
                      navigatTo(context,Widget_ScreenGoTo: SearchScreen());
                    },
                    icon: const Icon(Icons.search),
                ),
                IconButton(
                    onPressed: (){
                      cubit.ChangeAppThemeMode();
                    },
                    icon: cubit.isDark? const Icon(Icons.light_mode_sharp):const Icon(Icons.dark_mode_sharp),

                ),
              ],
            ),

            bottomNavigationBar:BottomNavigationBar(
                items: cubit.bottomNavBar,
              currentIndex: cubit.currentindex,
              onTap: (int index){
                  cubit.changeBottomNavBar(index);
              },
            ) ,
            body: cubit.screens[cubit.currentindex],
          );
        },
    );
  }
}
