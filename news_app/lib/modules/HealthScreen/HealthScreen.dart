import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/api/api.dart';

import '../../shared/components/Reusable_component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> healthList=ApiData().health;
        return ArticalBulider(healthList,context);
      },
    );
  }
}
