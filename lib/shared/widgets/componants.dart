import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

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

class DefaultPhoneField extends StatelessWidget {
  TextEditingController controller;
  ValueChanged<PhoneNumber>? onChange;
  DefaultPhoneField({required this.controller, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'EG',
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),
      controller: controller,
      showCountryFlag: true,
      disableLengthCheck: false,
      dropdownTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
      flagsButtonMargin: const EdgeInsets.only(left: 16),
      dropdownIconPosition: IconPosition.trailing,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        fillColor: Colors.grey.shade50,
        hintText: '1012151434',
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      onChanged: onChange,
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }
}

class SocialButton extends StatelessWidget {
  String socialChar;
  String text;
  Color color;
  void Function()? onPressed;
  SocialButton(
      {Key? key,
      required this.onPressed,
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
          onPressed: onPressed,
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

navigateAndRemove(context, widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

PreferredSizeWidget defaultAppBar(
    {required BuildContext context,
    required String title,
    List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    titleSpacing: 5,
    actions: actions,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

Future<bool?> toast({required String msg, required StateOfToast state}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: chooseColorForToast(state),
      textColor: Colors.white,
      fontSize: 16.0);
}
// toast({required String message, required StateOfToast state}) async {
//   return Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseColorForToast(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

enum StateOfToast { success, error, warrning }

Color chooseColorForToast(StateOfToast state) {
  Color? color;
  switch (state) {
    case StateOfToast.success:
      color = Colors.green;
      break;
    case StateOfToast.warrning:
      color = Colors.amber;
      break;
    case StateOfToast.error:
      color = Colors.red;
      break;
    default:
  }
  return color!;
}
