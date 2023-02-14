
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/shared/bloc_observer.dart';
import 'layout/home_layout.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_design.dart';

void main (){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home:HomeLayout (),
    );
  }
}

