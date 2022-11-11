import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/Reusable_component.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> searchList = ApiData().search;
        return Scaffold(
          appBar: AppBar( title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: (){
                  NewsCubit.get(context).changeAppThemeMode();
                },
                icon: NewsCubit.get(context).isDark? const Icon(Icons.light_mode_sharp):const Icon(Icons.dark_mode_sharp),

              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defulttextformfiled(
                  backgroundoftextformfield: NewsCubit.get(context).isDark?Colors.white12:Colors.white,
                  TextColor: NewsCubit.get(context).isDark?Colors.white:Colors.black87,
                  controller: searchController,
                    keyboardType: TextInputType.text,
                    text: 'Search',
                    prefixIcon:const Icon(Icons.search),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  onFieldSubmitted: (shearchedvalue) {
                    ApiData().getsearch(valueOfSearch:shearchedvalue );
                  },
                    ),
              ),
              Expanded(child: ArticalBulider(searchList, context)),
            ],
          ),
        );
      },
    );
  }
}