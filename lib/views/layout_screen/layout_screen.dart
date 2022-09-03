import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/controllers/cubit/app_cubit.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';
import 'package:social_app/shared/style/icon_broken.dart';
import 'package:social_app/shared/widgets/componants.dart';
import 'package:social_app/views/layout_screen/add_post/add_post.dart';
import 'package:social_app/views/login_screen/login_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is SignOutSucceedState) {
        navigateAndRemove(context, LoginScreen());
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(cubit.screensTitle[cubit.currentIndex]),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(IconBroken.Notification)),
            IconButton(onPressed: () {}, icon: const Icon(IconBroken.Search)),
            const SizedBox(width: 8)
          ],
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          items: cubit.items,
          onTap: (index) {
            cubit.changeNavBarIndex(index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context, const AddPost());
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      );
    });
  }
}
