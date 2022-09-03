import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controllers/cubit/app_cubit.dart';
import 'package:social_app/data/cached_helper.dart';
import 'package:social_app/data/constant.dart';
import 'package:social_app/shared/style/theme.dart';
import 'package:social_app/views/layout_screen/layout_screen.dart';
import 'package:social_app/views/login_screen/login_screen.dart';
import 'controllers/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachedHelper.initSharedPref();

  // await SharedPref.clear();

  token = CachedHelper.getData(key: "token");

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUser(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        home: token == null ? LoginScreen() : const LayoutScreen(),
      ),
    );
  }
}
