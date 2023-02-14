import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/modules/archived_taskes/archived_taskes_screen.dart';
import 'package:untitled2/modules/done_taskes/done_taskes_screen.dart';
import 'package:untitled2/shared/components/components.dart';
import 'package:untitled2/shared/cubit/cubit.dart';
import 'package:untitled2/shared/cubit/states.dart';

import '../modules/new_taskes/new_taskes_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget
{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit =  AppCubit.get(context) ;
         return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit. title[ cubit.currentIndex],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:25.0,
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context)=>cubit.screens[cubit.currentIndex],
              fallback:(context)=> Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,);
                    // insertToDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    // ).then((value)
                    // {
                    //   Navigator.pop(context);
                    //   isBottomSheetShown = false;
                    //   // setState(()
                    //   // {
                    //   //   fabIcon = Icons.edit;
                    //   // });
                    // });

                  }
                }else
                {scaffoldKey.currentState!.showBottomSheet((context) =>
                    Container(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (valeu)
                                {
                                  if(valeu.isEmpty)
                                  {
                                    return "title must not be Empty ";
                                  }
                                  return null ;
                                },
                                label: "Task Title",
                                prefix: Icons.title,
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              defaultFormField(
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value)
                                  {
                                    timeController.text = value!.format(context).toString();
                                    print(value!.format(context));
                                  });
                                },
                                controller: timeController,
                                type: TextInputType.datetime,
                                validate: (valeu)
                                {
                                  if(valeu.isEmpty)
                                  {
                                    return "time must not be Empty ";
                                  }
                                  return null ;
                                },
                                label: "Task time",
                                prefix: Icons.watch_later,
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              defaultFormField(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2023, 3 , 3) ,
                                  ).then((value)
                                  {
                                    print(DateFormat.yMMMd().format(value!));
                                    dateController.text=DateFormat.yMMMd().format(value!);
                                  });
                                },
                                controller: dateController,
                                type: TextInputType.datetime,
                                validate: (valeu)
                                {
                                  if(valeu.isEmpty)
                                  {
                                    return "date must not be Empty ";
                                  }
                                  return null ;
                                },
                                label: "Task Date",
                                prefix: Icons.calendar_today,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                ).closed.then((value) {
                  cubit.changeBottomSheetState(
                    isShow: false,
                    icon: Icons.edit,
                  );
                });
                cubit.changeBottomSheetState(
                  isShow: true,
                  icon: Icons.add,
                );
                }
              },
              child: Icon(
               cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:  cubit.currentIndex,
              onTap: (index )
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.menu,
                  ),
                  label: "Taskes",
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.check_circle_outline,
                  ),
                  label: "done",
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.archive_outlined,
                  ),
                  label: "Archived",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future <String> getName () async
  {
    return "Mohamed Ebrahim";
  }


}


