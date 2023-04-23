import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/Cubit/cubit.dart';
import '../../layout/news_app/Cubit/statse.dart';
import '../../shard/combonans/combonans.dart';

class sportsScreen extends StatelessWidget {
  const sportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return articalBuilder(list, context);
      },
    );
  }
}
