import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api.dart';
import 'package:news_app/shared/components/Reusable_component.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../../shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> businessList=ApiData().business;
        return ArticalBulider(businessList,context);

      },
    );
  }
}
