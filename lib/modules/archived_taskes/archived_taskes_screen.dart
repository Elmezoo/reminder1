import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/states.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class ArchivedTaskesScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener : (context, state){},
        builder : (context, state)
        {
          var taskes = AppCubit.get(context).archivetaskes;

          return taskesBuilder(
            taskes: taskes,
          );
        }
    );
  }
}
