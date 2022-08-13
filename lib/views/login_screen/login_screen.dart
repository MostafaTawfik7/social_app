import 'package:flutter/material.dart';
import 'package:social_app/shared/widgets/componants.dart';
import 'package:social_app/views/register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/login_image.png',
                    height: 180,
                    width: 250,
                  ),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Log in your existant account of Glam',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),
                  DefaultTextFormField(
                    controller: emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.mail,
                    validator: 'you must enter value',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  DefaultTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    validator: 'you must enter value',
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password ?',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text('LOG IN'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('Or connect using'),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialButton(
                        socialChar: 'f ',
                        text: 'facebook',
                        color: Colors.blue.shade800,
                      ),
                      SocialButton(
                        socialChar: 'G',
                        text: 'google',
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?'),
                      TextButton(
                        child: const Text('Sign UP'),
                        onPressed: () {
                          navigateTo(context, RegisterScreen());
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
  }
}
