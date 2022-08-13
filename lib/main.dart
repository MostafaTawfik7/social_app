import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_app/shared/style/theme.dart';
import 'package:social_app/views/login_screen/login_screen.dart';
import 'controllers/bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}
