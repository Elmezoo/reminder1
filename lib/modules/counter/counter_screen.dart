import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/modules/counter/cubit/states.dart';

import 'cubit/cubit.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {

    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>
        (
        listener: (context, state)
        {
          if(state is CounterMinusState){print ("minus state${state.couner}");};

          if(state is CounterPlusState){print ("plus state${state.Counter}");};

        } ,
        builder: (context, state)
        {
         return Scaffold (
            appBar: AppBar(
              title: Text(
                "Counter",
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  }, child: Text(
                    "MINUS",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "${CounterCubit.get(context).counter}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),

                    ),
                  ),
                  TextButton(onPressed: (){
                    CounterCubit.get(context).plus();
                  }, child: Text(
                    "PLUS",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  ),

                ],
              ),
            ),
          );
        } ,
      ),
    );
  }

}

