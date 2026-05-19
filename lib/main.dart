import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/screens/home_screen.dart';

void main(){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
