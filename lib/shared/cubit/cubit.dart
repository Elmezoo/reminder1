
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/shared/cubit/states.dart';

import '../../modules/archived_taskes/archived_taskes_screen.dart';
import '../../modules/done_taskes/done_taskes_screen.dart';
import '../../modules/new_taskes/new_taskes_screen.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super (AppInitialState());

  static AppCubit get (context) => BlocProvider.of(context);

  int currentIndex =  0;

  List<Widget> screens=
  [
    NewTaskesScreen(),
    DonTaskesScreen(),
    ArchivedTaskesScreen(),

  ];

  List<String> title =
  [
    "Taskes",
    "Done taskes",
    "Archived taskes",
  ];

  void changeIndex (int index)
  {
    currentIndex = index ; 
    emit(AppChangeBottomNavBarState());
  }

  Database ? database ;
  List<Map> newtaskes = [];
  List<Map> donetaskes = [];
  List<Map> archivetaskes = [];



  void createDatabase()
  {
     openDatabase(
      "todo.db",
      version: 1,
      onCreate:(database,version)
      {
        print ("database created");
        database.execute("CREATE TABLE TASKES (id INTEGER PRIMARY KEY, title TEXT , date TEXT, time TEXT, status TEXT)").then((value)
        {
          print ("table created");
        }).catchError((error)
        {
          print("error when creating table${ error.toString()}");
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);

        print("database opened");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
     });
  }
   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async
  {
     await  database!.transaction((txn)async
    {
      await txn.rawInsert("INSERT INTO taskes(title, date, time, status) VALUES('$title','$date','$time','new' )",
      ).then((value)
      {
        print('$value inserted succesfully');

        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print(" error when Inserting New Record ${ error.toString()}");
      });
    });

  }

  void getDataFromDatabase (database)
  {
    newtaskes = [];
    donetaskes = [];
    archivetaskes = [];


    emit(AppGetDatabaseLoadingState());

     database!.rawQuery("SELECT * FROM taskes").then((value)
     {

       value.forEach((element)
       {
         if(element["status"] == "new") {
           newtaskes.add(element);
         } else if(element["status"] == "done") {
           donetaskes.add(element);
         } else {
           archivetaskes.add(element);
         }
       });
print(donetaskes.length);
       emit(AppGetDatabaseState());

     });
  }

  void  updateData({
  required String status,
  required int id,

})async
  {
    database!.rawUpdate(
        'UPDATE taskes SET status = ?  WHERE id = ?',
        ['$status', id ]).then((value)
    {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void  deleteData({
    required int id,

  })async
  {
    database!.rawDelete('DELETE FROM taskes WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState
  ({

  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow ;
    fabIcon = icon ;

    emit(AppChangeBottomSheetState());
  }
}