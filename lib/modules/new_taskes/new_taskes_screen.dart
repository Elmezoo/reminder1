import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class NewTaskesScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     return BlocConsumer<AppCubit, AppStates>(
       listener : (context, state){},
       builder : (context, state)
       {

         var taskes = AppCubit.get(context).newtaskes;

         return taskesBuilder(
           taskes: taskes,
         );
       }
     );
  }
}
