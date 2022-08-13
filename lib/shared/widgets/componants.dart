import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType textInputType;
  String validator;
  String hintText;
  bool isPassword;
  IconData prefixIcon;
  DefaultTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.prefixIcon,
      required this.validator,
      this.isPassword = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validator;
        }
        return null;
      },
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Icon(
            prefixIcon,
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  String socialChar;
  String text;
  Color color;
  SocialButton(
      {Key? key,
      required this.socialChar,
      required this.text,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 50,
      child: MaterialButton(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: color,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                socialChar,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              )
            ],
          )),
    );
  }
}

navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
