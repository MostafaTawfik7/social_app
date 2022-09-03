import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_app/controllers/cubit/app_cubit.dart';
import 'package:social_app/controllers/cubit/state_cubit.dart';
import 'package:social_app/data/cached_helper.dart';
import 'package:social_app/data/constant.dart';
import 'package:social_app/shared/widgets/componants.dart';
import 'package:social_app/views/layout_screen/layout_screen.dart';
import 'package:social_app/views/login_screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? phoneFeild;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) async {
      var cubit = AppCubit.get(context);

      if (state is CreateUserSucceedState) {
        token = cubit.userID;
        CachedHelper.saveData(key: 'token', value: cubit.userID);
        navigateAndRemove(context, const LayoutScreen());
      }
    }, builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Let\'s Get Started!',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'create an account to Glam to get all features',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    DefaultTextFormField(
                      hintText: 'Name',
                      controller: nameController,
                      prefixIcon: Icons.person,
                      validator: 'you must enter value',
                    ),
                    const SizedBox(height: 20),
                    DefaultPhoneField(
                      controller: phoneController,
                      onChange: (phone) {
                        phoneFeild = phone.completeNumber;
                      },
                    ),
                    const SizedBox(height: 10),
                    DefaultTextFormField(
                      hintText: 'Email',
                      controller: emailController,
                      prefixIcon: Icons.email,
                      validator: 'you must enter value',
                    ),
                    const SizedBox(height: 20),
                    DefaultTextFormField(
                        hintText: 'Password',
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        validator: 'you must enter value',
                        isPassword: true),
                    const SizedBox(height: 20),
                    DefaultTextFormField(
                        hintText: 'Confirm password',
                        controller: confirmPasswordController,
                        prefixIcon: Icons.lock,
                        validator: 'you must enter value',
                        isPassword: true),
                    const SizedBox(height: 40),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: state is! LoadingState
                            ? ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.createUser(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneFeild!);
                                  }
                                },
                                child: const Text(
                                  'CREATE',
                                ))
                            : const Center(child: CircularProgressIndicator())),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?'),
                        TextButton(
                          child: const Text('Login here'),
                          onPressed: () {
                            navigateTo(context, LoginScreen());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
